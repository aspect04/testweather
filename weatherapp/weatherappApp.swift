//
//  musicplayerApp.swift
//  musicplayer
//
//  Created by a on 25/6/24.
//

import SwiftUI

@main
struct musicplayerApp: App {
    @State var apiRunning: Bool = false
        
    var body: some Scene {
        WindowGroup {
            ContentView(apirunning: $apiRunning)
        }
    }
}

