//
//  DailyNavView.swift
//  testweather
//
//  Created by a on 19/8/25.
//

import SwiftUI

struct DailyNavView: View {
    
    @Binding var cityName: String
    @Binding var weather: weatherData?

    var body: some View {
        
        Text("Hi, \(cityName)")
        Text("It is, \(day)")
        Text("It is \(Int(weather?.main.temp ?? 0))°F")
            .font(.system(size: 22))
    }
}
