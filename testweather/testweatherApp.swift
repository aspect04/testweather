//
//  testweatherApp.swift
//  testweather
//
//  Created by a on 28/6/25.
//

import SwiftUI
import SwiftData

@main
struct testweatherApp: App {
    
    @State var apiRunning: Bool = false
    @State var apiKey: String = ""

    var body: some Scene {
        WindowGroup {
            ContentView(apiKey: $apiKey, apirunning: $apiRunning)
        }
    }
}
