





import Foundation

class editperson{
    
    
    func edit(bool : Bool)->[address]{
        
       let input = addperson()
       var editinput = input.addperson(bool: bool)
        var count = 0
        var j:Int?
        print("Enter first Name")
        var name = readLine()
        for i in 0..<editinput.count
        {
            if editinput[i].first_name == name
            {
                count += 1
                j = i
            }
            
        }
        if count > 1
        {
            print("Enter last Name")
            var lname = readLine()
            var count1 = 0
            for i in 0..<editinput.count
            {
                if editinput[i].first_name == name && editinput[i].last_name == lname
                {
                    j = i
                    count1 = count1 + 1
                }
            }
            if count1 > 1
            {
                print("Enter Mobile No.")
                var mobno = readLine()
                var count2 = 0
                for i in 0..<editinput.count
                {
                    if editinput[i].phoneno == mobno
                    {
                        print("What do you want to edit")
                        print("If you want to edit city then press c otherwise press any character")
                        var input1 = readLine()
                        if input1 == "c" || input1 == "C"
                        {
                            print("Enter new city name")
                            var newcity = readLine()
                            if newcity == editinput[i].city
                            {
                                print("This value is  already here..try new one")
                            }
                            else
                            {
                                editinput[i].city = newcity!
                            }
                        }
                        else
                        {
                            print("press a to edit address or press anything to move forward")
                            var input = readLine()
                            if input == "a"
                            {
                                print("Enter new Address")
                                var inputnewaddr = readLine()
                                if inputnewaddr == editinput[i].adddr
                                {
                                    print("This value is already here..try new one")
                                }
                                else
                                {
                                    editinput[i].adddr = inputnewaddr!
                                }
                            }
                            else
                            {
                                print("z to edit zipcode or press anything to move forward")
                                var input = readLine()
                                if input == "z" || input == "Z"
                                {
                                    print("Enter new zipcode")
                                    var inputzip = readLine()
                                    if inputzip == editinput[i].zipcode
                                    {
                                        print("This value is already here..try new one")
                                    }
                                    else
                                    {
                                        editinput[i].zipcode = inputzip!
                                    }
                                }
                                else
                                {
                                    print("m to edit mobile no.")
                                    var input = readLine()
                                    if input == "m" || input == "M"
                                    {
                                        var inputmob = readLine()
                                        if inputmob == editinput[i].phoneno
                                        {
                                            print("This value is already here..try new one")
                                        }
                                        else
                                        {
                                            editinput[i].phoneno = inputmob!
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                print("What do you want to edit")
                print("If you want to edit city then press c otherwise press any character")
                var input1 = readLine()
                if input1 == "c" || input1 == "C"
                {
                    print("Enter new city name")
                    var newcity = readLine()
                    if newcity == editinput[j!].city
                    {
                        print("This value is  already here..try new one")
                    }
                    else
                    {
                        editinput[j!].city = newcity!
                    }
                }
                else
                {
                    print("press a to edit address or press anything to move forward")
                    var input = readLine()
                    if input == "a"
                    {
                        print("Enter new Address")
                        var inputnewaddr = readLine()
                        if inputnewaddr == editinput[j!].adddr
                        {
                            print("This value is already here..try new one")
                        }
                        else
                        {
                            editinput[j!].adddr = inputnewaddr!
                        }
                    }
                    else
                    {
                        print("z to edit zipcode or press anything to move forward")
                        var input = readLine()
                        if input == "z" || input == "Z"
                        {
                            print("Enter new zipcode")
                            var inputzip = readLine()
                            if inputzip == editinput[j!].zipcode
                            {
                                print("This value is already here..try new one")
                            }
                            else
                            {
                                editinput[j!].zipcode = inputzip!
                            }
                        }
                        else
                        {
                            print("m to edit mobile no.")
                            var input = readLine()
                            if input == "m" || input == "M"
                            {
                                var inputmob = readLine()
                                if inputmob == editinput[j!].phoneno
                                {
                                    print("This value is already here..try new one")
                                }
                                else
                                {
                                    editinput[j!].phoneno = inputmob!
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        else
        {
            print("What do you want to edit")
            print("If you want to edit city then press c otherwise press any character")
            var input1 = readLine()
            if input1 == "c" || input1 == "C"
            {
                print("Enter new city name")
                var newcity = readLine()
                if newcity == editinput[j!].city
                {
                    print("This value is  already here..try new one")
                }
                else
                {
                    editinput[j!].city = newcity!
                }
            }
            else
            {
                print("press a to edit address or press anything to move forward")
                var input = readLine()
                if input == "a"
                {
                    print("Enter new Address")
                    var inputnewaddr = readLine()
                    if inputnewaddr == editinput[j!].adddr
                    {
                        print("This value is already here..try new one")
                    }
                    else
                    {
                        editinput[j!].adddr = inputnewaddr!
                    }
                }
                else
                {
                    print("z to edit zipcode or press anything to move forward")
                    var input = readLine()
                    if input == "z" || input == "Z"
                    {
                        print("Enter new zipcode")
                        var inputzip = readLine()
                        if inputzip == editinput[j!].zipcode
                        {
                            print("This value is already here..try new one")
                        }
                        else
                        {
                            editinput[j!].zipcode = inputzip!
                        }
                    }
                    else
                    {
                        print("m to edit mobile no.")
                        var input = readLine()
                        if input == "m" || input == "M"
                        {
                            var inputmob = readLine()
                            if inputmob == editinput[j!].phoneno
                            {
                                print("This value is already here..try new one")
                            }
                            else
                            {
                                editinput[j!].phoneno = inputmob!
                            }
                        }
                        
                    }
                }
            }
        }
        
        return editinput
    }
    
    
    
}
