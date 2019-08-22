//
//  main.swift
//  PrimeNumber
//
//  Created by admin on 22/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

print("Enter the starting number")
let name = readLine()
var num = Int(name!)

print("Enter the last number")
let name1 = readLine()
var num1 = Int(name1!)

var i = num!

var flag = 1

print(" Prime numbers within the given range are : ")
while i < num1!
{
    var j = 2
    
    if i == 0 || i == 1
    {
        i = i + 1
        continue
    }
    
    if  i == 2
    {
        print(i)
        i = i + 1
    }
    
    while j < i
    {
        if i%j == 0
        {
            flag = 0
            break
        }
        else
        {
            flag = 1
            j = j + 1
        }
    }
    if  flag == 0
    {
        i = i + 1
    }
    else
    {
        print(i)
        i = i + 1
    }
    
}

