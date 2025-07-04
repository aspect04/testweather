//
//  daily.swift
//  musicplayer
//
//  Created by a on 29/6/24.
//

import SwiftUI

struct trihourly: View {
    
    @State var triweather: triweatherData?
    @Binding var cityName: String
    @Binding var apiKey: String
    @Binding var apirunning: Bool
    @State var i: Int
    
    
    var body: some View {
       // if passes an error don't run
            
        VStack {
            
            Text(dateofDaily(unixtime: triweather?.list[i].dt ?? 0))
                .font(.system(size: 19, weight: .medium))
            
            if let triweather = triweather {
                Forecast(triweather: Binding.constant(triweather), i: 1)
            } else {
                Text("No weather data available")
                    .onAppear {
                        apirunning = false
                    }
            }
            
            Text("\(Int(triweather?.list.first?.main.temp ?? 0))°F")
                .font(.system(size: 16, weight: .medium))
            
        }
        .padding(12)
        .onChange(of: cityName) {
            Task {
                do {
                    triweather = try await trigetWeather()
                } catch {
                    print("Failed to fetch weather: \(error)")
                }
            }
        }
    }
    
    
    func trigetWeather() async throws -> triweatherData {
        let endpoint = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)&units=imperial"
        
        guard let url = URL(string: endpoint) else { throw appError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw appError.invalidReponse }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
         
            return try decoder.decode(triweatherData.self, from: data)
        } catch { throw appError.invalidData }
        
    }
    
    
    
}


func dateofDaily(unixtime: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(unixtime))

    let dateFormatter = DateFormatter()

    // Set Date Format
    dateFormatter.dateFormat = "HH:mm"

    // Convert Date to String
    return dateFormatter.string(from: date)
}

