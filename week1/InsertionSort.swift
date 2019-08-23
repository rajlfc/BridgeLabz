//
//  main.swift
//  InsertionSort
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func Insertionsort(a: inout [String])
{
    var n = a.count
    var i = 1
    while i < n
    {
        var key = a[i]
        var j = i - 1
        while (j > -1)  && (a[j] > key)
        {
            //print("while")
            a[j+1] = a[j]
            j = j - 1
        }
        a[j+1] = key
        i = i + 1
        //print(a)
    }
    //print(a)
}


var arrayofwords = [String]()

print("Input array size")
let input = readLine()
var size = Int(input!)

var i = 0
print("Input array elements")
while i != size!
{
    let inputword = readLine()
    //var inputword1 = Int(inputword!)
    arrayofwords.append(inputword!)
    i = i + 1
}
print("Your array is ")
print(arrayofwords)

Insertionsort(a: &arrayofwords)

print("After Insertion sort your array is ")
print(arrayofwords)



