



import Foundation

class printaddrbook{
    
    func printaddr()->[address]{
        
        let ip = inputperson()
        var persondetails = ip.input()
        var personadd = [address]()
       // var personadd1 = [address]()
        var bool =  true
        var count = 0
        while(bool)
        {
            var bool1 = true
            print("Print a for adding an entry e for editing an entry otherwise press anything")
            var input = readLine()
            if input == "a"
            {
                let ap = addperson()
                personadd = ap.addperson(bool: bool1)
            }
                //else if input == "e"
                //{
                //    let ep = editperson()
                //    var editpersondetails = ep.edit()
                //}
            else if input == "e"
            {
                bool1 = false
                let ep = editperson()
                personadd = ep.edit(bool: bool1)
            }
            else if input == "n"
            {
                break
            }
            else
            {
                print("Invalid input")
            }
            //    for i in 0..<personadd.count
            //    {
            //        personadd1.append(personadd[i])
            //    }
            
            //    for i in 0..<personadd1.count
            //    {
            //        print("\(personadd1[i].first_name!) \(personadd1[i].last_name!) \(personadd1[i].adddr!) \(personadd1[i].city!) \(personadd1[i].zipcode!)")
            //    }
            
        }
        
        return personadd
        

    }
    
}
