class MockBrightnessManager: BrightnessManaging {
    var currentBrightness: Double = 0.5
    var lastSetBrightness: Double?
    
    func setBrightness(_ value: Double) {
        lastSetBrightness = value
    }
} 