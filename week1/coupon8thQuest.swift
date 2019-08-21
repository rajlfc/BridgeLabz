//
//  main.swift
//  8thQuest
//
//  Created by admin on 21/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

let name = readLine()
var num = Int(name!)
var collect: Array<Bool> = Array(repeating: false, count: num!)
var count = 0
var distinct = 0
while distinct < num!
{
    let value = Int.random(in: 0...num!-1)
    count = count + 1
    if !collect[value]
    {
        distinct = distinct + 1
        collect[value] = true
    }
}
print(count)
