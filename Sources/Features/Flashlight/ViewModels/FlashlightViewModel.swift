import SwiftUI
import Combine

class FlashlightViewModel: ObservableObject {
    @Published var brightness: Double
    @Published var colorTemperature: Double
    
    private let brightnessManager: BrightnessManaging
    private var cancellables = Set<AnyCancellable>()
    
    init(brightnessManager: BrightnessManaging = BrightnessManager()) {
        self.brightnessManager = brightnessManager
        self.brightness = brightnessManager.currentBrightness
        self.colorTemperature = 0.5
        
        setupBindings()
    }
    
    private func setupBindings() {
        $brightness
            .sink { [weak self] newValue in
                self?.brightnessManager.setBrightness(newValue)
            }
            .store(in: &cancellables)
    }
} 