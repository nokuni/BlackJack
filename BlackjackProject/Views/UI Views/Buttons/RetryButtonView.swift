//
//  RetryButtonView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 23/06/2021.
//

import SwiftUI

struct RetryButtonView: View {
    var body: some View {
        Text("Play again")
            .font(.system(size: 25, weight: .heavy, design: .rounded))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.blue.cornerRadius(10))
            .padding(.horizontal, 35)
    }
}

struct RetryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RetryButtonView()
    }
}
