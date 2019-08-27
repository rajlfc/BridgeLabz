//
//  main.swift
//  DequeuePalindrome
//
//  Created by admin on 27/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

struct Queue<T>{
    
    var items:[T] = []
    
    mutating func enqueue(element: T)
    {
        items.append(element)
    }
    
    mutating func dequeue(no : Int) -> T?
    {
        
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.last
            items.remove(at: no)
            return tempElement
        }
    }
    
}
var flag = 1
print("Input String")
let inputstring = readLine()
var size = inputstring!.count - 1
var queue = Queue<String>()

for ch in inputstring!
{
    var c = String(ch)
    queue.enqueue(element: c)
}
//print(queue)
for ch1 in inputstring!
{
    var x = queue.dequeue(no: size)
    //print(x)
    var d = String(ch1)
    //print(d)
    if x==d
    {
        flag = 0
    }
    else
    {
        flag = 1
        break
    }
    size = size - 1
}

if flag == 0
{
    print("True this string is pallindrome")
}
else
{
    print("False this string is not pallindrome")
}




