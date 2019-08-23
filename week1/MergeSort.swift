//
//  main.swift
//  MergeSort
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation




func sort(a : inout [String], firstIndex : Int,lastIndex : Int)
{
    if firstIndex < lastIndex
    {
        var middileIndex = (firstIndex + lastIndex)/2
        sort(a: &a, firstIndex: firstIndex, lastIndex: middileIndex)
        sort(a: &a, firstIndex: middileIndex+1, lastIndex: lastIndex)
        merge(a : &a,firstIndex : firstIndex,middleIndex : middileIndex,lastIndex : lastIndex)
    }
    
    
}
func merge(a : inout [String],firstIndex : Int,middleIndex : Int,lastIndex : Int)
{
    let num1 = middleIndex - firstIndex + 1
    let num2 = lastIndex - middleIndex
    
    //let fiveZs = Array(repeating: "Z", count: 5)
    var firstArray = Array<String>(repeating: " ", count: num1)
    var secondArray = Array<String>(repeating: " ", count: num2)
    
    var i = 0
    while i != num1
    {
        firstArray[i] = a[firstIndex+i]
        i = i + 1
        
    }
    var j = 0
    while j != num2
    {
        secondArray[j] = a[middleIndex+1+j]
        j = j + 1
    }
    
    i = 0
    j = 0
    var k = firstIndex
    
    while i < num1 && j < num2
    {
        if firstArray[i] < secondArray[j]
        {
            a[k] = firstArray[i]
            i = i + 1
        }
        else
        {
            a[k] = secondArray[j]
            j = j + 1
        }
        k = k + 1
    }
    
    while i < num1
    {
        a[k] = firstArray[i]
        i = i + 1
        k = k + 1
    }
    while j < num2
    {
        a[k] = secondArray[j]
        j = j + 1
        k = k + 1
    }
    
}
var ArrayofWords = [String]()
var inputlower = " "
var i = 0
print("Enter the size of the array")
let input = readLine()
var size = Int(input!)
print("Input Array elements")
while i != size
{
    let inputword = readLine()
    //let lower = (inputword?.lowercased())!
    ArrayofWords.append(inputword!)
    i = i + 1
}
print("Given array is ")
print(ArrayofWords)

sort(a: &ArrayofWords, firstIndex: 0, lastIndex: size!-1)

print("The sorted array is :")
print(ArrayofWords)


