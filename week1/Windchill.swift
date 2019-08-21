//
//  main.swift
//  WindChill
//
//  Created by admin on 21/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
print("Enter Temperature")
let name = readLine()

var t = Double(name!)
print("Enter the value of v")
let name1 = readLine()
var v = Double(name1!)

if (abs(t!)>50)
{
    print("Invalid.. please provide a valid temperature")
}
else if v! > 120 || v! < 3
{
    print("Invalid... please provide a valid value of v ")
}

var w = 35.74 + 0.6215*t!
var z = w + ((0.4275 * t!) - 35.75)
var y = z * pow(v!,0.16)
print(y)

