//
//  main.swift
//  unorderedList
//
//  Created by admin on 26/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

//let path = "‎⁨file:///Documents/Sample1.txt⁩"
//do{
//
//    var data = try NSString(contentsOfFile: path,encoding: String.Encoding.ascii.rawValue)
//
//    print(data)
//
//
//}
//catch let error as NSError {
//    print("Ooops! Something went wrong: \(error)")
//}

//let path = Bundle.main.path(forResource: "Sample1", ofType: "txt")
////var data = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
//
//String(contentsOfFile: "String", encoding: "NSStringEncoding", error: "NSErrorPointer")

//if let string = try? String(contentsOfFile: "/User⁩/Users⁩/admin⁩/Documents/Sample1.txt⁩") {
//    print(string)
//}
//else
//{
//    print("Not Found")
//}


//let location = "/Users/you/Desktop/test.txt"
//let fileContent = NSString(contentsOfFile: location, encoding: NSUTF8StringEncoding, error: nil)

//protocol equalable : Equatable{
//
//    static func ==(lhs: Self, rhs: Self) -> Bool
//}

func equal<T: Equatable>(num1: T, num2: T) -> Bool {
    
     if num1 == num2
     {
        return true
     }
    else
     {
        return false
     }
}
////extension
//extension String{}

public class Snode<T>{

    var value: T
    var next: Snode<T>?
    
    init(value: T) {
        self.value = value
    }
    
}

public class Singlelinkedlist<T : Equatable>{
    
    var head: Snode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Snode<T>? {
        return head
    }
    
    public func append(value: T) {
        let newNode = Snode(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
            
        } else {
            head = newNode
        }
    }
    public func search(val: T)->Int
    {
           var current = head
           var flag = 0
           var i = 0
        while current != nil{
            
            //var x = equal(num1: current!.value, num2: val)
            var x = (current!.value == val)
            if x
            {
                flag = 1
                break
            }
            else
            {
                flag = 0
                current = current?.next
                i = i + 1
            }
            
        }
        if flag == 1
        {
            return i
        }
        else
        {
            return -1
        }
        
    }
    func deleteNode(at position: Int)
    {
        if head == nil{
            return
        }
        var temp = head
        
        if (position == 0)
        {
            head = temp?.next
            return
        }
        
        for _ in 0..<position-1 where temp != nil {
            temp = temp?.next
        }
        
        if temp == nil || temp?.next == nil{
            return
        }
        
        let nextToNextNode = temp?.next?.next
        
        temp?.next = nextToNextNode
    }
    func printList(no : Int)->[String] {
        var current: Snode? = head
        var stringarray = Array<String>(repeating: " ", count: no)
        var j = 0
        //assign the next instance
        while (current != nil) {
            //print("LL item is: \(current!.value)")
            stringarray[j] = current!.value as! String
            j = j + 1
            current = current?.next
        }
        return stringarray
    }
    
}




let location = NSString(string:"/Users/admin/Documents/Sample2.txt").expandingTildeInPath
do {
    
    let fileContent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
    print(fileContent)
    
    
    
    //let array = fileContent.split {$0 == " "}.map (String.init)
    
    var array = fileContent.components(separatedBy: " ")
    //print(array)
    var size = array.count-1
    let ll = Singlelinkedlist<String>()
    
    var i = 0
    
    while i <= size
    {
        ll.append(value: array[i])
        i = i + 1
    }
    print("Enter a word")
    let input = readLine()
    var result = ll.search(val: input!)
    if result != -1
    {
        
        ll.deleteNode(at: result)
        var array = ll.printList(no: size+1)
        print(array)
//        let fileUrl = NSURL(fileURLWithPath: "/Users/admin/Documents/Sample1.txt")
//        (array as NSArray).write(to: fileUrl as URL, atomically: true)
//        let savedArray = NSArray(contentsOf: fileUrl as URL) as! [[String]]
//
//        print(savedArray)
        let joined = array.joined(separator: " ")
        //joined.write(toFile: <#T##StringProtocol#>, atomically: <#T##Bool#>, encoding: <#T##String.Encoding#>)
        let saveToPath = "/Users/admin/Documents/Sample2.txt"
        do {
            try joined.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // handle error
        }
    }
    else
    {
        ll.append(value: input!)
        var array = ll.printList(no: size+1)
        print(array)
//        let fileUrl = NSURL(fileURLWithPath: "/Users/admin/Documents/Sample1.txt")
//        (array as NSArray).write(to: fileUrl as URL, atomically: true)
        let joined = array.joined(separator: " ")
        //joined.write(toFile: <#T##StringProtocol#>, atomically: <#T##Bool#>, encoding: <#T##String.Encoding#>)
        let saveToPath = "/Users/admin/Documents/Sample2.txt"
        do {
            try joined.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // handle error
        }
    }
  
    
}
catch let error {
    print(error.localizedDescription)
}




