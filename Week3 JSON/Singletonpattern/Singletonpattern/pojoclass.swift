



import Foundation


class POJO{
    
    static let shared = POJO()
    
    private init(){
        
    }
    
    var istrue : Bool?
    
    func checkbool(){
        
        istrue = true
        print("Boolean check is done")
    }
    
    
}
