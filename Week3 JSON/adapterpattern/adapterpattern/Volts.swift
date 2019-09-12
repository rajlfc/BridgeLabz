





import Foundation


class volt{
    
    public var volts : Int?
    
    init(volts : Int)
    {
        self.volts = volts
    }
    
    public func getVolts()->Int{
        
        return self.volts!
    }
    public func setVolts(volts : Int){
        
        self.volts = volts
    }
    
}

