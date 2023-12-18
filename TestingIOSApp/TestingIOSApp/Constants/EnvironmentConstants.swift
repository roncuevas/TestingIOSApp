import Foundation

enum Environment {
    case development
    case qualityAssurance
    case production
}

struct EnvironmentConstants {
    
    /// Changes the environment of the project
    static var environment: Environment = .development
    
    /// SplashScreen
    static var splashScreenTime: Double = 2
    
}
