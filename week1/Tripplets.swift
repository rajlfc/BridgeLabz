//
//  main.swift
//  9thQuest
//
//  Created by admin on 21/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

let name = readLine()
var num = Int(name!)
var i = 0
var a: Array<Int> = Array(repeating: 0, count: num!)
while i < num!
{
    let b = readLine()
    a[i] = Int(b!)!
    i = i + 1
}
i = 0
var j = 0
var k = 0
var count = 0
while i < num!
{
    j = i + 1
    while j < num!
    {
        k = j + 1
        while k < num!
        {
            if a[i] + a[j] + a[k] == 0
            {
                print("Tripplets indexes are : \(i),\(j),\(k)")
                count = count + 1
            }
            k = k + 1
        }
        j = j + 1
    }
    i = i + 1
}
print(count)

