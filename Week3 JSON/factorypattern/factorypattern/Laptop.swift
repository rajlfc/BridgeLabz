


import Foundation

class Laptop{
    
    var Ram : String?
    var Hdd : String?
    
    init(Ram:String,Hdd:String) {
        
        self.Ram = Ram
        self.Hdd = Hdd
    }
    func getRam() -> String {
        return self.Ram!
    }
    func gethdd() -> String {
        return self.Hdd!
    }
    
}
