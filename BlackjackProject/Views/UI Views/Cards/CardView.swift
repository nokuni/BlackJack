//
//  CardView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFill()
            .shadow(color: Color.black, radius: 0, x: 3, y: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
