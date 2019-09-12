



import Foundation


public class socketadpaterimpl : SocketAdapter
{
    
    private var sock = socket()
    
     func get120volt() -> volt {
        return sock.getvolt()
    }
    func get12volt() -> volt {
        var v : volt?
        v = sock.getvolt()
        return convertvolt(volts:v!,value:10)
    }
    func get3volt() -> volt {
        var v : volt?
        v = sock.getvolt()
        return convertvolt(volts:v!,value:40)
    }
    
    func convertvolt(volts:volt,value:Int)->volt
    {
        return volt(volts: volts.getVolts()/value)
    }
    
    
}
