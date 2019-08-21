//
//  main.swift
//  15thQuestion
//
//  Created by admin on 21/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
print("Enter the value of a :")
let name1 = readLine()
var a = Int(name1!)
print("Enter the value of b :")
let name2 = readLine()
var b = Int(name2!)
print("Enter the value of c :")
let name3 = readLine()
var c = Int(name3!)

var delta = Double(b!*b! - 4*a!*c!)

var root1 = Float(Double(-b!) + delta.squareRoot())/Float(2*a!)
root1 = root1.rounded()
var finalroot1 = Int(root1)
var root2 = Float(Double(-b!) - delta.squareRoot())/Float(2*a!)
root2 = root2.rounded()
var finalroot2 = Int(root2)
print("The first root is : \(finalroot1)")
print("The second root is : \(finalroot2)")
