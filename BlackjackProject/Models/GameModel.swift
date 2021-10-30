//
//  GameModel.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 13/07/2021.
//

import Foundation

struct BlackJackGame {
    var deck: [Card]
    var playerHand: [Card]
    var dealerHand: [Card]
    var sessionState: SessionState
    var isPlayerTurn: Bool
}

extension BlackJackGame {
    static let defaultGame = BlackJackGame(deck: Card.data, playerHand: [], dealerHand: [], sessionState: .unknown, isPlayerTurn: true)
}
