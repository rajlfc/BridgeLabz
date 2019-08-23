//
//  main.swift
//  DayofWeek
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class DayofWeek
{
    static func calculateDay(d : Int,m : Int,y : Int )->Int
    {
        
        var y1 = y - (14 - m)/12
        var x = y1 + y1/4 - y1/100 + y1/400
        var m1 = m + 12 * ((14-m)/12) - 2
        var d1 = ( d + x + (31 * m1)/12) % 7
        return d1
    }
    
}

print("Enter Day")
let input1 = readLine()
var d = Int(input1!)
print("Enter Month")
let input2 = readLine()
var m = Int(input2!)
print("Enter Year")
let input3 = readLine()
var y = Int(input3!)

var x = DayofWeek.calculateDay(d: d!, m: m!, y: y!)
print("The calculated Day is ")
if x == 0
{
    print("Sunday")
}
else if x == 1
{
    print("Monday")
}
else if x==2
{
    print("Tuesday")
}
else if x==3
{
    print("Wednesday")
}
else if x == 4
{
    print("Thursday")
}
else if x == 5
{
    print("Friday")
}
else
{
    print("Saturday")
}
