//
//  CustomAlertView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct SessionAlertView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        if vm.game.sessionState != .unknown {
            ZStack {
                Color
                    .black
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.horizontal)
                
                VStack(spacing: 15) {
                    
                    SessionRecap
                    
                    RetryButton
                }
            }
        }
    }
}

struct SessionAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SessionAlertView().environmentObject(ViewModel())
    }
}

extension SessionAlertView {
    private var SessionRecap: some View {
        SessionRecapView(playerHandValue: vm.handValue(of: vm.game.playerHand), dealerHandValue: vm.handValue(of: vm.game.dealerHand), sessionState: vm.game.sessionState)
    }
    private var RetryButton: some View {
        RetryButtonView().onTapGesture { vm.reset }
    }
}
