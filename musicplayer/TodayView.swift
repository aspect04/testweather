//
//  TodayView.swift
//  musicplayer
//
//  Created by a on 4/7/24.
//

import SwiftUI

struct TodayView: View {
    
    @Binding var cityName: String
    @Binding var weather: weatherData?
    @State private var apiRunning = true
    
    var body: some View {
        
        TextField("Enter city name", text: $cityName)
            .padding(-4)
            .font(.system(size: 26, weight: .medium))
            .multilineTextAlignment(.center)
        
        if let weather = weather {
            Forecast(weather: Binding.constant(weather))
        } else {
            Text("No weather data available")
                .onAppear {
                    apiRunning = false
                }
        }
        
    
        
        Text("\(Int(weather?.main.temp ?? 0))°F")
            .font(.system(size: 22))
        
    }
    
    
}
