//
//  main.swift
//  NewDecimaltoBinary
//
//  Created by admin on 22/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func toBinary(no : Int )->Array<Int>
    
{
    var inputArray = [Int]()
    var num = no
    
    while num > 0
    {
        var r = num % 2
        inputArray.append(r)
        num = num/2
    }
    return inputArray
}

print("Enter the Decimal No.")
let input = readLine()
var inputnum = Int(input!)
var outputArray = [Int]()
outputArray = toBinary(no: inputnum!)
var k = outputArray.count-1
print("Output Binary Number is : ")

k = outputArray.count
while k < 32
{
    outputArray.append(0)
    k = k + 1
}
var c = outputArray.count-1

while c >= 0
{
    print(outputArray[c])
    c = c - 1
}


