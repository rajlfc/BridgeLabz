//
//  main.swift
//  Binary.java
//
//  Created by admin on 22/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func swap(no1: inout Int, no2: inout Int)
{
    var temp = 0
    
    temp = no1
    no1 = no2
    no2 = temp
}

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
//print("Output Binary Number is : ")
while k != 8
{
    outputArray.append(0)
    k = k + 1
}

outputArray.reverse()

var c = 0

while c != 4
{
    var temp = 0
    temp = outputArray[c]
    outputArray[c] = outputArray[c+4]
    outputArray[c+4] = temp
    c = c + 1
}
var d = outputArray.count - 1
var sum = 0
var i = 0
while d >= 0
{
    
    sum = sum + outputArray[i] * Int(pow(Double(2), Double(d)))
    d = d - 1
    i = i + 1
}
print("Sum is :")
print(sum)

if sum & (sum-1) == 0
 {
   print("Decimal number is a power of 2")
  }

else
{
   print("Decimal number is not a power of 2")
}



