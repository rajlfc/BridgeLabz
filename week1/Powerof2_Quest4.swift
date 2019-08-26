//
//  main.swift
//  Fourth_Powerof2
//
//  Created by admin on 20/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func power(no : Int)->Int
{
    //print(no)
    var j=0
    var result = 1
    while j < no
    {
        result = result * 2
        j=j+1
    }
    return result
}
let name=readLine()
var num=Int(name!)
var i=0
while i < num!
{
    print(power(no: i))
    i=i+1
}

