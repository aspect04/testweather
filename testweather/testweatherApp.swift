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
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(apirunning: $apiRunning)
        }
        .modelContainer(sharedModelContainer)
    }
}
