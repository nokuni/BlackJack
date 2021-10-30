//
//  BlackjackView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct BlackjackView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack {
            Background
            VStack(spacing: 20) {
                Money
                Title
                DealerHand
                PlayerHand
                Buttons
            }
            Alert
        }
    }
}

struct BlackjackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackjackView().environmentObject(ViewModel())
    }
}

extension BlackjackView {
    var Background: some View {
        LinearGradient(gradient: Gradient(colors: [.black, .seaGreen]), startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
    }
    var Money: some View {
        Text("Money : \(vm.money, specifier: "%.0f") $")
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .heavy, design: .rounded))
    }
    var Title: some View {
        TurnTitleView(isYourTurn: vm.game.isPlayerTurn)
    }
    var DealerHand: some View {
        HandView(username: "Dealer", hand: vm.game.dealerHand, handValue: vm.handValue(of: vm.game.dealerHand))
    }
    var PlayerHand: some View {
        HandView(username: "Your", hand: vm.game.playerHand, handValue: vm.handValue(of: vm.game.playerHand))
    }
    var Buttons: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                HitButton
                StandButton
            }
            HStack(spacing: 15) {
                DoubleButton
                SplitButton
            }
            SurrenderButton
        }
        .padding(.horizontal)
    }
    var HitButton: some View {
        ActionButtonView(actionName: "hit", actionColor: .white, shadowColor: .darkGreen, color: .lawnGreen)
            .onTapGesture {
                vm.drawCard(for: &vm.game.playerHand)
                vm.checkPlayerOutcome
            }
    }
    var StandButton: some View {
        ActionButtonView(actionName: "stand", actionColor: .white, shadowColor: .darkRed, color: .red)
            .onTapGesture {
                vm.startDealerTurn
            }
    }
    var DoubleButton: some View {
        ActionButtonView(actionName: "Double", actionColor: .white, shadowColor: .saddleBrown, color: .gold)
    }
    var SplitButton: some View {
        ActionButtonView(actionName: "Split", actionColor: .white, shadowColor: .blue, color: .deepSkyBlue)
    }
    var SurrenderButton: some View {
        ActionButtonView(actionName: "Surrender", actionColor: .white, shadowColor: .indigo, color: .blueViolet)
            .onTapGesture {
                vm.surrender
            }
    }
    var Alert: some View {
        SessionAlertView()
    }
}
