import XCTest
@testable import FlashLight

class FlashlightViewModelTests: XCTestCase {
    var sut: FlashlightViewModel!
    var mockBrightnessManager: MockBrightnessManager!
    
    override func setUp() {
        super.setUp()
        mockBrightnessManager = MockBrightnessManager()
        sut = FlashlightViewModel(brightnessManager: mockBrightnessManager)
    }
    
    override func tearDown() {
        sut = nil
        mockBrightnessManager = nil
        super.tearDown()
    }
    
    func testBrightnessUpdate() {
        // Given
        let expectedBrightness = 0.7
        
        // When
        sut.brightness = expectedBrightness
        
        // Then
        XCTAssertEqual(mockBrightnessManager.lastSetBrightness, expectedBrightness)
    }
} 