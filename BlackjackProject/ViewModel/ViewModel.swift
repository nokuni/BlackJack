//
//  ViewModel.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    @Published var game = BlackJackGame.defaultGame
    @Published var money: Double = 100
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        deliverCards
        checkBlackjack
    }
}

extension ViewModel {
    
    // MARK: COMMON TO THE PLAYER AND THE DEALER
    
    // Add random cards to both hands
    var deliverCards: Void {
        for _ in 0..<2 { drawCard(for: &game.playerHand) }
        for _ in 0..<1 { drawCard(for: &game.dealerHand) }
    }
    
    // Add a random card in a hand
    func drawCard(for hand: inout [Card]) {
        if let randomCard = game.deck.randomElement(),
           let index = game.deck.firstIndex(of: randomCard) {
            hand.append(randomCard)
            game.deck.remove(at: index)
        }
    }
    
    // Check blackjack on both hand
    var checkBlackjack: Void {
        switch true {
        case handValue(of: game.playerHand) == 21 && handValue(of: game.dealerHand) < handValue(of: game.playerHand):
            sessionResult(sessionState: .blackjack)
        case handValue(of: game.dealerHand) == 21 && handValue(of: game.dealerHand) > handValue(of: game.playerHand):
            sessionResult(sessionState: .loose)
        case handValue(of: game.playerHand) == 21 && handValue(of: game.dealerHand) == 21:
            sessionResult(sessionState: .draw)
        default:
            game.sessionState = .unknown
        }
    }
    
    // Adjust the Ace value on hand
    func setAceValue(in hand: inout [Card]) {
        if hand.contains(where: { $0.value == 11 }),
           handValue(of: hand) > 21,
           let index = hand.firstIndex(where: { $0.value == 11 }) {
            hand[index].value = 1
        }
    }
    
    // MARK: - PLAYER ONLY
    
    // Check the outcome of the player
    var checkPlayerOutcome: Void {
        setAceValue(in: &game.playerHand)
        checkBlackjack
        if handValue(of: game.playerHand) > 21 { sessionResult(sessionState: .loose) }
    }
    
    // Loose outcome and half the bet
    var surrender: Void {
        game.sessionState = .loose
        self.money -= 5
    }
    
    // MARK: - DEALER ONLY
    
    // Dealer start drawing cards until the outcome is set.
    var startDealerTurn: Void {
        
        game.isPlayerTurn = false
        
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if !self.isDealerDrawing {
                    self.checkDealerOutcome
                    self.cancellables.forEach { $0.cancel() }
                    self.cancellables.removeAll()
                    self.game.isPlayerTurn = true
                } else {
                    self.drawCard(for: &self.game.dealerHand)
                    self.setAceValue(in: &self.game.dealerHand)
                }
            }
            .store(in: &cancellables)
    }
    
    // Check the outcome of the dealer
    var checkDealerOutcome: Void {
        switch true {
        case handValue(of: game.dealerHand) == 21 && handValue(of: game.dealerHand) > handValue(of: game.playerHand):
            sessionResult(sessionState: .loose)
        case handValue(of: game.dealerHand) > handValue(of: game.playerHand) && handValue(of: game.dealerHand) < 21:
            sessionResult(sessionState: .loose)
        case handValue(of: game.dealerHand) < handValue(of: game.playerHand) && handValue(of: game.playerHand) < 21:
            sessionResult(sessionState: .win)
        case handValue(of: game.dealerHand) == handValue(of: game.playerHand):
            sessionResult(sessionState: .draw)
        case handValue(of: game.dealerHand) > 21:
            sessionResult(sessionState: .win)
        default:
            game.sessionState = .unknown
        }
    }
    
    // Check if dealer is able to draw card or stop
    var isDealerDrawing : Bool {
        handValue(of: game.dealerHand) >= 17 || handValue(of: game.dealerHand) >= handValue(of: game.playerHand) ? false : true
    }
    
    // MARK: - GAME RELATED
    
    // Apply changes depending on the outcome of the session
    func sessionResult(sessionState: SessionState) {
        self.game.sessionState = sessionState
        if self.game.sessionState == .blackjack || self.game.sessionState == .win {
            self.money += 10
        } else if self.game.sessionState == .loose {
            self.money -= 10
        }
    }
    
    // Give the total value of a hand
    func handValue(of cards: @autoclosure () -> [Card]) -> Int {
        cards().map(\.value).reduce(0,+)
    }
    
    // Reset blackjack session
    var reset: Void {
        game.deck = Card.data
        game.sessionState = .unknown
        game.dealerHand = [Card]()
        game.playerHand = [Card]()
//        game.playerHand.removeAll()
//        game.dealerHand.removeAll()
        deliverCards
        checkBlackjack
    }
}
