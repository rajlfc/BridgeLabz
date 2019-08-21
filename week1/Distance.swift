//
//  main.swift
//  Distance
//
//  Created by admin on 21/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
print("Enter the value of first co-ordinate")
let name1 = readLine()
var x = Int(name1!)
print("Enter the value of second co-ordinate")
let name2 = readLine()
var y = Int(name2!)

var value = x!*x! + y!*y!
var result = Double(value)
var final = result.squareRoot()
final = final.rounded()
var final1 = Int(final)
print("The distance from origin is :\(final1)")
