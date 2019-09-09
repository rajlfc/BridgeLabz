




import Foundation

func searchDname(doc : [Doctor],input : String)->[Int]
{
    var result = [Int]()
    var count = doc.count
    for i in 0..<count
    {
        if doc[i].name == input
        {
            result.append(i)
        }
    }
    return result
    
}
func searchDid(doc:[Doctor],input : String)->[Int]
{
    var count = doc.count
    var result = [Int]()
    for i in 0..<count
    {
        if doc[i].id == input
        {
            result.append(i)
        }
    }
    return result
}
func searchDSp(doc:[Doctor],input : String)->[Int]
{
    var count = doc.count
    var result = [Int]()
    for i in 0..<count
    {
        if doc[i].specialization == input
        {
            result.append(i)
        }
    }
    return result
}
func searchAvail(doc:[Doctor],input : String)->[Int]
{
    var result = [Int]()
    var count = doc.count
    if input != "Both"
    {
        for i in 0..<count
        {
            if doc[i].availability == input || doc[i].availability == "Both"
            {
                result.append(i)
            }
        }
    }
    else
    {
        for i in 0..<count
        {
            if doc[i].availability == input
            {
                result.append(i)
            }
        }
    }
    
    return result
}

func searchD(doc : [Doctor]){
    
    print("How do you want to search Doctor")
    
    print("press n or N for name\tpress i or I for id\tpress s or S for specialization\tpress a or A for availability")
    
    var input = readLine()
    
    if input == "n" || input == "N"
    {
        print("Enter Doctor Name")
        var inputname = readLine()
        var result = searchDname(doc: doc, input: inputname!)
        if result.count != 0 {
            print("Doctor details")
            for i in 0..<result.count
            {
              print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[result[i]].specialization!)\t\(doc[result[i]].availability!)")
            }
        }
        else
        {
            print("Check your Doctor name and try again")
        }
    }
    else if input == "i" || input == "I"
    {
        print("Enter Doctor id")
        var inputid = readLine()
        var result = searchDid(doc: doc, input: inputid!)
        if result.count != 0{
            print("Doctor details")
            for i in 0..<result.count
            {
                print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[i].specialization!)\t\(doc[i].availability!)")
            }
        }
        else
        {
            print("Check your Doctor id and try again")
        }
        
    }
    else if input == "s" || input == "S"
    {
        print("Enter doctor specialization")
        var inputsp = readLine()
        var result = searchDSp(doc: doc, input: inputsp!)
        if result.count != 0{
            print("Doctor details")
            for i in 0..<result.count
            {
                 print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[result[i]].specialization!)\t\(doc[result[i]].availability!)")
            }
        }
        else
        {
            print("Check your Doctor specialization and try again")
        }
    }
    else if input == "a" || input == "A"
    {
        print("Enter doctor availability")
        var inputavail = readLine()
        var result = searchAvail(doc: doc, input: inputavail!)
        if result.count != 0
        {
            print("Doctor Details")
            for i in 0..<result.count
            {
                print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[result[i]].specialization!)\t\(doc[result[i]].availability!)")
            }
        }
        else
        {
            print("Check your Doctor availability and try again")
        }
    }
    else
    {
        print("Invalid Input..try again")
    }
    
}

