//
//  StepperButtonView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct StepperButtonView: View {
    var name: String
    var body: some View {
        Image(systemName: name)
            .frame(maxWidth: .infinity, maxHeight: 30)
            .background(
                Color
                    .white
                    .cornerRadius(5)
                    .shadow(color: .black, radius: 5)
            )
    }
}

struct StepperButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StepperButtonView(name: "minus")
    }
}
