//
//  weatherData.swift
//  musicplayer
//
//  Created by a on 30/6/24.
//

import SwiftUI


struct weatherData: Codable {
    let main: Main
    let weather: [Weather]
    
}

struct Weather: Codable {
    let main, description: String
    
}

struct Main: Codable {
    let temp, feelsLike: Double
    
}



struct triweatherData: Codable {
    let list: [triListy]
    
}

struct triListy: Codable {
    let dt: Int
    let main: triMain
    let weather: [triWeather]
    
    
}

struct triWeather: Codable {
    let main, description: String
    
}

struct triMain: Codable {
    let temp, feelsLike: Double
    
}
