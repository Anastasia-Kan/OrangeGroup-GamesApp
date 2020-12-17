//
//  OrangeGroup_GamesAppApp.swift
//  OrangeGroup-GamesApp
//
//  Created by Anastasia Kantor on 2020-11-24.
//

import SwiftUI
import Firebase

@main
struct OrangeGroup_GamesAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
