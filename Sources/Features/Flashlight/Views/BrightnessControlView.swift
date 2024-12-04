import SwiftUI

struct BrightnessControlView: View {
    @Binding var brightness: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("亮度")
                .foregroundColor(.black)
            
            HStack {
                Image(systemName: "sun.min.fill")
                    .foregroundColor(.black)
                Slider(value: $brightness, in: 0...1)
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
    }
} 