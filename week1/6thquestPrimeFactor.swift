//
//  main.swift
//  Sixth_primeFactor
//
//  Created by admin on 20/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


func primefac(no : Int)->Void
{
    var n = no
    while n%2==0
    {
        print(2)
        n = n/2
    }
    var i=3
    while i <= Int(Double(n).squareRoot())
    {
        while n%i==0
        {
            print(i)
            n = n/i
        }
        i = i+2
    }
    if n>2
    {
        print(n)
    }
}

let name=readLine()
var num = Int(name!)
print("Prime Factors are : ")
primefac(no: num!)

