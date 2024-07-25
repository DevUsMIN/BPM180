//
//  BPM180App.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//

import SwiftUI

@main
struct BPM180App: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: AuthViewModel())
        }
    }
}
