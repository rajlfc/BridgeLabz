//
//  main.swift
//  BubbleSort
//
//  Created by admin on 22/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


var inputArray = [Int]()
print("Enter Size")
let inputSize = readLine()
var size = Int(inputSize!)
//print(size)
var swap = 0
var i = 0
print("Input array elements")
//while i < size!
//{
//    var inputnum = readLine()
//    var num = Int(inputnum!)
//    inputArray[i] = num!
//    i = i + 1
//}

for i in 0..<size! {
    var inputnum = readLine()
    var num = Int(inputnum!)
    inputArray.append(num!)
//    i = i + 1
}

var j = 0
var k = 1

while j < size!
{
    while k < size!-j
    {
        if inputArray[k-1] > inputArray[k]
        {
            swap = inputArray[k-1]
            inputArray[k-1] = inputArray[k]
            inputArray[k] = swap
        }
        k = k + 1
    }
    j = j + 1
}
var l = 0
print("Output")
while l < size!
{
    print(inputArray[l])
    l = l + 1
}

