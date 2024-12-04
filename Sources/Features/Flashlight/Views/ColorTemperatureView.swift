import SwiftUI

struct ColorTemperatureView: View {
    @Binding var temperature: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("色温")
                .foregroundColor(.black)
            
            HStack {
                Image(systemName: "thermometer.sun.fill")
                    .foregroundColor(.blue)
                Slider(value: $temperature, in: 0...1)
                Image(systemName: "thermometer.sun.fill")
                    .foregroundColor(.orange)
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
    }
} 