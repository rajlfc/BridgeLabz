



import Foundation

func searchPname(doc : [patient],input : String)->[Int]
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
func searchPid(doc:[patient],input : Int)->[Int]
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
func searchPmob(doc:[patient],input : String)->[Int]
{
    var count = doc.count
    var result = [Int]()
    for i in 0..<count
    {
        if doc[i].mobno == input
        {
            result.append(i)
        }
    }
    return result
}
//func searchAvail(doc:[Doctor],input : String)->[Int]
//{
//    var result = [Int]()
//    var count = doc.count
//    if input != "Both"
//    {
//        for i in 0..<count
//        {
//            if doc[i].availability == input || doc[i].availability == "Both"
//            {
//                result.append(i)
//            }
//        }
//    }
//    else
//    {
//        for i in 0..<count
//        {
//            if doc[i].availability == input
//            {
//                result.append(i)
//            }
//        }
//    }
//
//    return result
//}

func searchP(doc : [patient]){
    
    print("How do you want to search Patient")
    
    print("press n or N for name\tpress i or I for id\tpress m or M for Mobile No.")
    
    var input = readLine()
    
    if input == "n" || input == "N"
    {
        print("Enter Patient Name")
        var inputname = readLine()
        var result = searchPname(doc: doc, input: inputname!)
        if result.count != 0 {
            print("Patient details")
            for i in 0..<result.count
            {
                print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[result[i]].mobno!)")
            }
        }
        else
        {
            print("Check your Patient name and try again")
        }
    }
    else if input == "i" || input == "I"
    {
        print("Enter Patient id")
        var inputid = Int(readLine()!)
        var result = searchPid(doc: doc, input: inputid!)
        if result.count != 0{
            print("Patient details")
            for i in 0..<result.count
            {
                print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[result[i]].mobno!)")
            }
        }
        else
        {
            print("Check your Patient id and try again")
        }
        
    }
    else if input == "m" || input == "M"
    {
        print("Enter patient Mobile No.")
        var inputm = readLine()
        var result = searchPmob(doc: doc, input: inputm!)
        if result.count != 0{
            print("Patient details")
            for i in 0..<result.count
            {
                print("\(doc[result[i]].name!)\t\(doc[result[i]].id!)\t\(doc[result[i]].mobno!)")
            }
        }
        else
        {
            print("Check your Patient mobno and try again")
        }
    }
    
    else
    {
        print("Invalid Input..try again")
    }
    
}


