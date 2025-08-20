//
//  DailyNavView.swift
//  testweather
//
//  Created by a on 19/8/25.
//

import SwiftUI

struct DailyNavView: View {
    
    @Binding var cityName: String
    @Binding var triweather: triweatherData?
    @Binding var i: Int

    
    var body: some View {
        
        Text("Hi, \(cityName)")
        Text(dateofDaily(unixtime: triweather?.list[i].dt ?? 0))
        Text("It is \(Int(triweather?.list.first?.main.temp ?? 0))°F")
            .font(.system(size: 22))
    }
}
