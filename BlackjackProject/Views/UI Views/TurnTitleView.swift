//
//  TurnTitleView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct TurnTitleView: View {
    var isYourTurn: Bool
    var body: some View {
        HStack {
            Text(isYourTurn ? "Your decision" : "Dealer Turn")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .heavy, design: .rounded))
            if !isYourTurn {
                DotAnimationView()
            }
        }
    }
}

struct TurnTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TurnTitleView(isYourTurn: true)
    }
}
