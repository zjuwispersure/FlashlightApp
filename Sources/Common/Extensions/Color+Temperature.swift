extension Color {
    static func temperature(_ value: Double) -> Color {
        Color(
            red: 1,
            green: Double(0.8 + (0.2 * value)),
            blue: Double(0.6 + (0.4 * value))
        )
    }
} 