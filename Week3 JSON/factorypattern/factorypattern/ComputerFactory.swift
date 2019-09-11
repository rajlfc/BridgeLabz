



import Foundation


class ComputerFactory{
    
    
    func input(){
        
        print("Enter what you like to buy")
        print("Press p for pc l for laptop s for server")
        
        var inputuser = readLine()
        if inputuser == "p"
        {
            print("PC")
            let pc = PC(Ram: "8GB", Hdd: "500GB")
            print("Ram :\(pc.getRam())")
            print("Hdd : \(pc.gethdd())")
        }
        else if inputuser == "l"
        {
            print("Laptop")
            let lappy = Laptop(Ram: "16GB", Hdd: "300GB")
            print("Ram : \(lappy.getRam())")
            print("Hdd : \(lappy.gethdd())")
        }
        else if inputuser == "s"
        {
            print("Server")
            let ser = server(Ram: "4GB", Hdd: "700GB")
            print("Ram : \(ser.getRam())")
            print("Hdd : \(ser.gethdd())")
        }
        else{
            
            print("Invalid Input")
        }
        
    }
    
}
