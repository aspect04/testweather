//
//  SearchView.swift
//  testweather
//
//  Created by a on 19/8/25.
//

//Main Screen

import SwiftUI

struct SearchView:View {
    
    @Binding var cityName: String

    var body: some View {
        Image(systemName: "plus.circle.fill") // Use SF Symbol for a filled circular plus
            .font(.largeTitle) // Adjust font size as needed
            .foregroundColor(.white) // Color of the plus sign
            .padding() // Add padding around the icon
            .background(Color.blue) // Background color of the circle
            .clipShape(Circle()) // Clip the content to a circle shape
            .onclick(new weatherview)
        
        TextField("Enter city name", text: $cityName)
            .padding(-4)
            .font(.system(size: 26, weight: .medium))
            .multilineTextAlignment(.center)
            .searchable(text: $cityName)
            .isFirstResponder(true)
    }
}


