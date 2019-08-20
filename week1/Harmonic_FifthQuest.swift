//
//  main.swift
//  Fifth_Harmonic
//
//  Created by admin on 20/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func nharmonic(no : Int)->Float
{
    let result=1
    var result1=Float(result)
    var i=2
    while i<=no
    {
        result1 = result1 + 1/Float(i)
        i=i+1
    }
    return result1
}

let name = readLine()
var num = Int(name!)
print(nharmonic(no: num!))


