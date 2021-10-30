//
//  ActionButtonView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct ActionButtonView: View {
    @EnvironmentObject var vm: ViewModel
    var actionName: String
    var actionColor: Color
    var shadowColor: Color
    var color: Color
    var body: some View {
        Text(actionName.uppercased())
            .foregroundColor(actionColor)
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(vm.game.isPlayerTurn ? color : .gray)
            )
            .shadow(color: shadowColor, radius: 0, x: 2, y: 2)
            .disabled(!vm.game.isPlayerTurn)
    }
}

struct DrawButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(actionName: "HIT", actionColor: .white, shadowColor: .darkenGoldenRod, color: .black)
            .environmentObject(ViewModel())
    }
}
