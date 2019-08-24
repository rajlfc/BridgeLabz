//
//  main.swift
//  TestTask
//
//  Created by admin on 24/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
print("Enter Size")
let input = readLine()
var size = Int(input!)

var i = 0

public var max = 100001

public var time = [Int]()
var j = 0
while j != 100001
{
    time.append(0)
    j = j + 1
}
public var marker = 0
public var overshoot = 0

func maximum(n1 : Int,n2:Int)->Int
{
    if n1 >= n2
    {
        return n1

    }
   else
    {
       return n2
    }
    
}

func schedule(num1 : Int ,num2 : Int)->Int
{
    let d_i = num2
    var a = num1
    let b = num2
    if  d_i <= marker
    {
        overshoot += num1
        return overshoot
    }
    var k = d_i;
    while k > marker && k > 0 && a > 0
    {
        if(time[k] > 0)
        {
            k = k - 1
            continue
        }
        else
        {
            time[k] = 1
            a =  a - 1
            k = k - 1
        }
    }
    if a != 0
        {
            overshoot += a
            marker  =  maximum(n1: b, n2: marker)
        }
    return overshoot
}

print("Enter d and m values")
while i < size!
{
    let inputd = readLine()
    let input_d = Int(inputd!)
    
    let inputm = readLine()
    let input_m = Int(inputm!)
    
    print("Overshoot deadline by \(schedule(num1: input_m!, num2: input_d!)) for task \(i+1)")
    i = i + 1
}
