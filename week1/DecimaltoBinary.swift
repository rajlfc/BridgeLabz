//
//  main.swift
//  DecimaltoBinary
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
while k >= 0
{
    print(outputArray[k])
    
    k = k - 1
    
}

