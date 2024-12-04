protocol BrightnessManaging {
    var currentBrightness: Double { get }
    func setBrightness(_ value: Double)
}

class BrightnessManager: BrightnessManaging {
    var currentBrightness: Double {
        #if os(iOS)
        return UIScreen.main.brightness
        #else
        return 0.5
        #endif
    }
    
    func setBrightness(_ value: Double) {
        #if os(iOS)
        UIScreen.main.brightness = value
        #endif
    }
} 