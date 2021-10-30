//
//  HandView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct HandView: View {
    var username: String
    var hand : [Card]
    var handValue : Int
    var body: some View {
        VStack {
            HStack {
                ForEach(hand, id: \.self) { card in
                    CardView(card: card)
                        .padding(.horizontal, -40)
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                }
            }
            .frame(maxWidth: 0)
            
            Text("\(username) value is \(handValue)")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .heavy, design: .rounded))
                .shadow(color: Color.black, radius: 0, x: 2, y: 2)
        }
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(username: "Dealer", hand: [], handValue: 0).environmentObject(ViewModel())
    }
}
