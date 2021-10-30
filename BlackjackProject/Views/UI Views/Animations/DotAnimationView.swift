//
//  DotAnimationView.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

struct DotAnimationView: View {
    @State private var count = 0
    @State private var dots : [CGFloat] = Array(repeating: -10, count: 3)
    @State private var timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack {
            ForEach(0..<dots.count, id: \.self) { index in
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 5, height: 5)
                    .offset(y: count == index ? dots[count] : 0)
            }
        }
        .animation(.spring())
        .onReceive(timer) { _ in
            count = count < 3 ? count + 1 : 0
        }
    }
}

struct DotAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        DotAnimationView()
    }
}
