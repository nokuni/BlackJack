//
//  Extensions.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

extension Array {
    var halfSplit: [[Element]] {
        let count = self.count
        let half = count / 2
        let left = Array(self[0 ..< half])
        let right = Array(self[0 ..< count])
        return [left, right]
    }
}
