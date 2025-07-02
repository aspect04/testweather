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
    @State private var searchIsActive = false
    
    var body: some View {
        
        TextField("Enter city name", text: $cityName)
            .padding(-4)
            .font(.system(size: 26, weight: .medium))
            .multilineTextAlignment(.center)
            .searchable(text: $cityName)
            .searchSuggestions {
//                ForEach(cityName.suggestedSearches) { suggestion in
//                    Label(suggestion.title,  image: suggestion.image)
//                        .searchCompletion(suggestion.text)
//                }
                Text("Bothell").searchCompletion("Bothell")
                Text("Dallas").searchCompletion("Dallas")
                Text("London").searchCompletion("London")
                }
        
        
        
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
