//
//  main.swift
//  Stopwatch
//
//  Created by admin on 29/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


let hh2 = (Calendar.current.component(.hour, from: Date()))
let mm2 = (Calendar.current.component(.minute, from: Date()))
let ss2 = (Calendar.current.component(.second, from: Date()))
//let mss2 = (Calendar.current.component(.nanosecond, from: Date()))

print(hh2,":", mm2,":", ss2)



//let stop = readLine()
var input = " "

while input != "s"
{
    print("Stopwatch Running")
    print("Enter s to stop")
    input = readLine()!
    
}
let hh3 = (Calendar.current.component(.hour, from: Date()))
let mm3 = (Calendar.current.component(.minute, from: Date()))
let ss3 = (Calendar.current.component(.second, from: Date()))
//let mss3 = (Calendar.current.component(.nanosecond, from: Date()))

print(hh3,":", mm3,":", ss3)

print("Elapsed Time")

var e1 = hh3-hh2
var e2 = mm3-mm2
var e3 = ss3-ss2

print(e1,":",e2,":",e3)





