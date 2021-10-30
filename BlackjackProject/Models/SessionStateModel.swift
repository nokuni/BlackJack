//
//  GameStateModel.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

enum SessionState: String, CaseIterable {
    case unknown = "Unknown"
    case blackjack = "Blackjack !"
    case win = "You win!"
    case loose = "You lose!"
    case draw = "Draw!"
    
    var color: Color {
        switch self {
        case .unknown:
            return .white
        case .blackjack:
            return .yellow
        case .win:
            return .green
        case .loose:
            return .red
        case .draw:
            return .black
        }
    }
}
