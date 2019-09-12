



import Foundation


struct Logger {
    let strategy: LoggerStrategy
    
    func log(_ message: String) {
        strategy.log(message)
    }
}
