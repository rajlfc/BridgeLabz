//
//  main.swift
//  Calendar
//
//  Created by admin on 27/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
class CalendarProg
{
    func findmaxday(name : String,no: Int)->Int
    {
        var months = [" ","January","February","March","April", "May", "June",
                      "July", "August", "September", "October", "November", "December"]
        
        var d = [0,31,28,31,30,31,30,31,31,30,31,30,31]
        
        if ((no%400 == 0) || ((no % 100 != 0 ) && (no % 4 == 0)))
        {
            d[2] = 29
        }
        var max = 0
        for i in 0..<13
        {
            if name == months[i]
            {
                max = d[i]
            }
        }
        //print(max)
        return max
    }
    func findDayNo(wname : String)->Int
    {
        var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday"]
        
        var f = 0
        for i in 0..<7
        {
            if wname == days[i]
            {
                f = i
            }
        }
        //print(f)
        return f
    }
    
    func fillcalendar(max :Int ,f: Int,name : String,y:Int)
    {
        var a:[[Int]] = Array(repeating: Array(repeating: 0, count: 7), count: 6)
        var b = f
        var x = 1
        var z = f
        for i in 0..<6
        {
            for j in b..<7
            {
                if x <= max
                {
                    a[i][j] = x
                    x = x + 1
                }
                b = 0
            }
        }
        
        for j in 0..<z
        {
            a[0][j] = a[5][j]
        }
        //print(a)
        printcalendar(a : a,name : name,y : y)
    }
    func printcalendar(a: [[Int]],name : String,y : Int)
    {
        print("\n\t-----------------------------------")
        print("\t\t\t  \(name) \(y)")
        print("\t--------------------------------------")
        print("\tSUN\tMON\tTUE\tWED\tTHU\tFRI\tSAT")
        print("\t--------------------------------------")
        
        for i in 0..<5
        {
            for j in 0..<7
            {
                if a[i][j] != 0
                {
                    print("\t\(a[i][j])",terminator:" ")
                }
                else
                {
                    print(terminator:"\t ")
                }
            }
            print("\n\t---------------------------------------------")
        }
    }
    func calculateDay(d : Int,m : Int,y : Int )->String
    {
        
        var y1 = y - (14 - m)/12
        var x = y1 + y1/4 - y1/100 + y1/400
        var m1 = m + 12 * ((14-m)/12) - 2
        var d1 = ( d + x + (31 * m1)/12) % 7
        print(d1)
        if d1 == 0
        {
            return "Sunday"
        }
        else if d1 == 1
        {
            return "Monday"
        }
        else if d1 == 2
        {
            return "Tuesday"
        }
        else if d1 == 3
        {
            return "Wednesday"
        }
        else if d1 == 4
        {
            return "Thursday"
        }
        else if d1 == 5
        {
            return "Friday"
        }
        else
        {
            return "Saturday"
        }
    }
}

let ob = CalendarProg()
print("Enter year")
let inputyear = readLine()
var inputy = Int(inputyear!)
print("Enter Month")
let inputmonth = readLine()
var x = 0
if inputmonth! == "January"
{
    x = 1
}
else if inputmonth! == "February"
{
    x = 2
}
else if inputmonth! == "March"
{
    x = 3
}
else if inputmonth! == "April"
{
    x = 4
}
else if inputmonth! == "May"
{
    x = 5
}
else if inputmonth! == "June"
{
    x = 6
}
else if inputmonth! == "July"
{
    x = 7
}
else if inputmonth! == "August"
{
    x = 8
}
else if inputmonth! == "September"
{
    x = 9
}
else if inputmonth! == "October"
{
    x = 10
}
else if inputmonth! == "November"
{
    x = 11
}
else if inputmonth! == "December"
{
    x = 12
}
else
{
    x = 0
}




//var inputm = Int(inputmonth!)

var m = ob.findmaxday(name: inputmonth!, no: inputy!)

var w = ob.calculateDay(d: 1, m: x, y: inputy!)

var f = ob.findDayNo(wname: w)

ob.fillcalendar(max: m, f: f, name: inputmonth!, y: inputy!)
