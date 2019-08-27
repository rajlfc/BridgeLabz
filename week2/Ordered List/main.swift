//
//  main.swift
//  OrderedList
//
//  Created by admin on 26/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

protocol equalable {
    
        static func >(lhs: Self, rhs: Self) -> Bool
    }

func equal<T: equalable>(num1: T, num2: T) -> Bool {
    
    if num1 > num2
    {
        return true
    }
    else
    {
        return false
    }
}


public class Snode<T>{
    
    var value: T
    var next: Snode<T>?
    
    init(value: T) {
        self.value = value
    }
    
}

class Singlelinkedlist<T : Equatable>{
    
    var head: Snode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Snode<T>? {
        return head
    }
    public func swapvar( a:inout Int , b:inout Int)
    {
        var c = 0
        c = a
        a = b
        b = c
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
    
    public func sortll(no : Int)->[Int]
    {
        var intarray = Array<Int>(repeating: 0, count: no)
        var current = head
        var i = 0
        while current != nil
        {
            intarray[i] = current?.value as! Int
            current = current?.next
            i = i + 1
        }
        
        //print(intarray)
       
        intarray.sort()
        
        //print(intarray)
        
        return intarray
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
    func printList(no : Int)->[Int] {
        var current: Snode? = head
        var integerarray = Array<Int>(repeating: 0, count: no)
        var k = 0
        //assign the next instance
        while (current != nil) {
            //print("LL item is: \(current!.value)")
            integerarray[k] = current!.value as! Int
            print(integerarray[0])
            print(k)
            k = k + 1
            current = current?.next
        }
        return integerarray
    }
}

let location = NSString(string:"/Users/admin/BridgeLabz/week2/Ordered List/Ordered.txt").expandingTildeInPath


do{
    let fileofcontent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
    //print(fileofcontent)
    
    var array = fileofcontent.components(separatedBy: " ")
    print(array)
    var size = array.count-1
    var j = 0
    let ll = Singlelinkedlist<Int>()
    while j <= size
    {
        ll.append(value: Int(array[j])!)
        j = j + 1
    }
    
    
    var i = 0
    
    var x = ll.sortll(no: size+1)
    print(x)

    
       //let joined = x.joined(separator: " ")
        var s = x.map { String($0) }.joined(separator: " ")

    let saveToPath = "/Users/admin/BridgeLabz/week2/Ordered List/NewOrdered.txt"
    do {
        try s.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        // handle error
    }

    
}
catch{
    print("Not Found")
}
