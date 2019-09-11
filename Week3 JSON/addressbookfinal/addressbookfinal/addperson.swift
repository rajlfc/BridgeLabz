




import Foundation


class addperson{
    
    var existing = [address]()
    
    func addperson(bool : Bool)->[address]
    {
        var ip = inputperson()
        existing = ip.input()
        //var bool = true
        while(bool)
        {
            print("Do you want to add another entry")
            print("if yes then press y otherwise press n")
            var inputquestion = readLine()
            if inputquestion == "y" || inputquestion == "Y"
            {
                print("Enter your first name")
                var inputfname = readLine()
                print("Enter your last name")
                var inputlname = readLine()
                print("Enter your address")
                var inputaddress = readLine()
                print("Enter your city")
                var inputcity = readLine()
                print("Enter your phone no." )
                var inputphone = readLine()
                print("Enter your zipcode")
                var inputzip = readLine()
                let i4 = address(first_name: inputfname!, last_name: inputlname!, addr: inputaddress!, city: inputcity!, phoneno: inputphone!, zipcode: inputzip!)
                
                existing.append(i4)
                
                
            }
            else if inputquestion == "n" || inputquestion == "N"
            {
                break
            }
            else
            {
                print("Invalid Input press either y or n")
            }
        }
        return existing
        
    }
    
}
