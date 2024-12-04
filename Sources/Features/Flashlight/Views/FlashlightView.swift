//
//  ContentView.swift
//  FlashLight
//
//  Created by chengshuo zhang on 2024/12/3.
//
//  Description:
//  这是一个跨平台的手电筒应用的主视图。
//  提供屏幕亮度调节和色温调节功能。
//
//  Features:
//  - 屏幕亮度控制 (仅iOS)：通过滑块调节系统亮度
//  - 色温调节：通过改变背景色模拟不同色温效果
//
//  Usage:
//  - 亮度滑块：左右滑动可调节屏幕亮度（0-100%）
//  - 色温滑块：左右滑动可调节色温（冷色调-暖色调）
//
//  Technical Notes:
//  - 使用条件编译(#if os(iOS)) 处理平台特定代码
//  - 亮度控制功能仅在iOS设备上可用
//  - 色温效果通过动态计算RGB值实现

import SwiftUI

#if os(iOS)
import UIKit
#endif

/// 主视图结构体
struct ContentView: View {
    // MARK: - Properties
    
    /// 控制屏幕亮度的状态变量
    #if os(iOS)
    @State private var brightness: Double = UIScreen.main.brightness
    #else
    @State private var brightness: Double = 0.5 // macOS 默认值
    #endif
    
    /// 控制色温的状态变量 (0.0 = 冷色调, 1.0 = 暖色调)
    @State private var colorTemperature: Double = 0.5
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // 背景色会根据色温值在冷暖色之间变化
            colorBackground
            
            VStack {
                Spacer()
                brightnessControl
                colorTemperatureControl
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
    
    // MARK: - Views
    
    /// 动态背景色视图
    private var colorBackground: some View {
        Color(
            red: 1,
            green: Double(0.8 + (0.2 * colorTemperature)),
            blue: Double(0.6 + (0.4 * colorTemperature))
        )
        .ignoresSafeArea()
    }
    
    /// 亮度控制视图
    private var brightnessControl: some View {
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
    }
    
    /// 色温控制视图
    private var colorTemperatureControl: some View {
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
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
