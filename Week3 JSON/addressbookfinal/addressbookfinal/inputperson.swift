



import Foundation


class inputperson{
    
    var inperson = [address]()
    
    func input()->[address]
    {
        let i1 = address(first_name: "Sudipta", last_name: "Bhattacharjee", addr: "Barasat", city: "Kolkata", phoneno: "9836744302", zipcode: "700126")
        inperson.append(i1)
        
        let i2 = address(first_name: "Raj", last_name: "Gerrard", addr: "Hridaypur", city: "Kolkata", phoneno: "9674589076", zipcode: "700134")
        inperson.append(i2)
        
        let i3 = address(first_name: "Pradip", last_name: "Bhattacharjee", addr: "Madhyamgram", city: "Kolkata", phoneno: "9831134762", zipcode: "700132")
        inperson.append(i3)
        
        
        return inperson
    }
    
    
    
}
