//
//  ContentView.swift
//  Shared
//
//  Created by chengshuo zhang on 2024/12/3.
//

import SwiftUI

#if os(iOS)
import UIKit
#endif

struct ContentView: View {
    #if os(iOS)
    @State private var brightness: Double = UIScreen.main.brightness
    #else
    @State private var brightness: Double = 0.5 // macOS 默认值
    #endif
    @State private var colorTemperature: Double = 0.5
    
    var body: some View {
        ZStack {
            // 背景色会根据色温值在冷暖色之间变化
            Color(
                red: 1,
                green: Double(0.8 + (0.2 * colorTemperature)),
                blue: Double(0.6 + (0.4 * colorTemperature))
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // 亮度控制
                VStack(alignment: .leading, spacing: 10) {
                    Text("亮度")
                        .foregroundColor(.black)
                    
                    HStack {
                        Image(systemName: "sun.min.fill")
                            .foregroundColor(.black)
                        Slider(value: $brightness, in: 0...1) { _ in
                            #if os(iOS)
                            UIScreen.main.brightness = brightness
                            #endif
                        }
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                
                // 色温控制
                VStack(alignment: .leading, spacing: 10) {
                    Text("色温")
                        .foregroundColor(.black)
                    
                    HStack {
                        Image(systemName: "thermometer.sun.fill")
                            .foregroundColor(.blue)
                        Slider(value: $colorTemperature, in: 0...1)
                        Image(systemName: "thermometer.sun.fill")
                            .foregroundColor(.orange)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
