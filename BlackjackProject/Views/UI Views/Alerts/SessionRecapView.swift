//
//  SessionRecapView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 20/06/2021.
//

import SwiftUI

struct SessionRecapView: View {
    var playerHandValue: Int
    var dealerHandValue: Int
    var sessionState: SessionState
    var body: some View {
        Text("Player : \(playerHandValue)")
            .foregroundColor(.blue)
            .font(.system(size: 25, weight: .heavy, design: .rounded))
        
        Text("Dealer : \(dealerHandValue)")
            .foregroundColor(.red)
            .font(.system(size: 25, weight: .heavy, design: .rounded))
        
        Text(sessionState.rawValue)
            .foregroundColor(sessionState.color)
            .font(.system(size: 30, weight: .heavy, design: .rounded))
            .padding()
    }
}

struct SessionRecapView_Previews: PreviewProvider {
    static var previews: some View {
        SessionRecapView(playerHandValue: 0, dealerHandValue: 0, sessionState: .unknown)
    }
}
