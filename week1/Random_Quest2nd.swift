//
//  main.swift
//  second_random
//
//  Created by admin on 20/08/19.
//  Copyright © 2019 admin. All rights reserved.
//
//Flip a coin
import Foundation

func input()->String{
    let keyboard=FileHandle.standardInput
    let inputData=keyboard.availableData
    return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String
    
    
}
let num=readLine()
var num1=Int(num!)
//print(num1!)
var i=0
var count1=0
var count2=0
while i < num1!
{
    let fraction = Double.random(in: 0...1)
    if(fraction<0.5)
    {
        count1=count1+1
    }
    else
    {
        count2=count2+1;
    }
    i = i + 1
}
//print(count1)
//print(count2)
var num2=Float(count1)/Float(num1!)
num2=(num2)*(100)

num2=(num2.rounded(.down))
//num2=num2*1
var num3=Float(count2)/Float(num1!)

num3=Float(num3)*Float(100)
num3=num3.rounded(.down)
//num3=num3
print(num2)
print(num3)

