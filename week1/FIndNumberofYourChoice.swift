//
//  main.swift
//  FindNumberSecret
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func search(low : Int,high: Int)->Int
{
    //var i = 0
    if high-low == 1
    {
        return low
    }
    else
    {
        let mid = low + (high-low)/2
        print("Is it less than \(mid) then press t otherwise f")
        let input = readLine()
        if input == "t"
        {
            
            return search(low : low,high : mid)
        }
        else
        {
            return search(low : mid,high : high)
        }
    }
    
}

print("Input a number ")
let input = readLine()
var number = Int(input!)
if number! & (number!-1) == 0
{
    print("Think of a number between 0 to \(number!-1)")
    var result = search(low: 0, high: number!)
    print("Your number is \(result)")
}
else
{
    print("Enter a number which is a power of 2")
}




