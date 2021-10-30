//
//  BlackjackProjectApp.swift
//  BlackjackProject
//
//  Created by Yann Christophe Maertens on 19/06/2021.
//

import SwiftUI

@main
struct BlackjackProjectApp: App {
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            BlackjackView().environmentObject(vm)
        }
    }
}
