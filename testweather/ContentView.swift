//
//  ContentView.swift
//  musicplayer
//
//  Created by a on 25/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var apiKey = ""
    @AppStorage("cityName") private var cityName = ""
    @State private var weather: weatherData?
    @State private var isShowingAlert = false
    @Binding var apirunning: Bool
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.blue, Color.gray], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .center) {
                    TodayView(cityName: $cityName, weather: $weather)
                }
                .frame(alignment: .center)
                .padding(.top, 15)
                .padding(.bottom, 100)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0...39, id: \.self) { i in
                            trihourly(cityName: $cityName, apiKey: $apiKey, apirunning: $apirunning,i: i)
                        
                        }
                    }
                }
                .padding(.top, 100)
                
            }
                .padding(.bottom, 100)
                
                .onChange(of: cityName) {
                    Task {
                        do {
                            weather = try await getWeather()
                        } catch {
                            print("Failed to fetch weather: \(error)")
                            isShowingAlert.toggle()
                        }
                    }
                }
            }
        }
    
    //gets weather json into weatherdata vat
    func getWeather() async throws -> weatherData {
        let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=imperial"
        
        guard let url = URL(string: endpoint) else { throw appError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw appError.invalidReponse }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
         
            return try decoder.decode(weatherData.self, from: data)
        } catch { throw appError.invalidData }
        
    }
}

//possible error enum
enum appError: Error {
    case invalidURL
    case invalidReponse
    case invalidData
}


struct ContentView_Previews: PreviewProvider {
    @State static var apiRunning: Bool = false

    static var previews: some View {
        ContentView(apirunning: $apiRunning)
    }
}
