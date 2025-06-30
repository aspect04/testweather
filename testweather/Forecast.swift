//
//  Forecast.swift
//  musicplayer
//
//  Created by a on 4/7/24.
//

import SwiftUI

struct Forecast: View {
    @Binding var weather: weatherData
    @Binding var triweather: triweatherData
    @State private var skyForecast: String = ""

   /* init(weather: Binding<weatherData>) {
        self._weather = weather
        self._triweather = Binding.constant(triweather)
        self._skyForecast = State(initialValue: weather.wrappedValue.weather.first?.description ?? "")
    }
    
    init(triweather: Binding<triweatherData>, i: Int) {
        self._triweather = triweather
        weather = Binding(weather)
        self._skyForecast = State(initialValue: triweather.wrappedValue.list[i].weather.first?.description ?? "")
    }*/
    
    init(weather: Binding<weatherData>) {
        self._weather = weather
        self._triweather = Binding.constant(triweatherData(list: [])) // Provide a default value or use a proper initialization
        self._skyForecast = State(initialValue: weather.wrappedValue.weather.first?.description ?? "")
    }

    init(triweather: Binding<triweatherData>, i: Int) {
        self._triweather = triweather
        self._weather = Binding.constant(weatherData(main: Main(temp: 0.0, feelsLike: 0.0), weather: [])) // Provide a default value or use a proper initialization
        self._skyForecast = State(initialValue: triweather.wrappedValue.list[i].weather.first?.description ?? "")
    }
    
    var body: some View {
        switch skyForecast {
        case "clear sky":
            Image(systemName: "sun.max.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Sunny")
                .font(.system(size: 19, weight: .bold))
        case "rain":
            Image(systemName: "cloud.rain.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Rain")
                .font(.system(size: 19, weight: .bold))
        case "thunderstorm":
            Image(systemName: "cloud.bolt.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Thunderstorm")
                .font(.system(size: 19, weight: .bold))
        case "shower rain":
            Image(systemName: "cloud.drizzle.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Light Rain")
                .font(.system(size: 19, weight: .bold))
        case "snow":
            Image(systemName: "snowflake")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Snow")
                .font(.system(size: 19, weight: .bold))
        case "mist":
            Image(systemName: "cloud.fog.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Fog")
                .font(.system(size: 19, weight: .bold))
        case "few clouds":
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Partly Cloudy")
                .font(.system(size: 19, weight: .bold))
        default:
            Image(systemName: "cloud.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(2)
            Text("Cloudy")
                .font(.system(size: 19, weight: .bold))
        }
    }
}
