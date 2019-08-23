//
//  main.swift
//  sqrt
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class calculateSquareroot{
    
    static func sqrt(no1 : Int)->Int
    {
        
        var t = no1
        while abs(t-no1/t) > Int((pow(Double(M_E),Double(-15)))*Double(t))
        {
            
            //var t = no1
            var intermediate = Double(no1)/Double(t)
            t = Int(Double((Double(intermediate) + Double(t))/Double(2)))
            
        }
        return t
        
    }
    
}


print("Enter your number")
let input = readLine()
var c = Int(input!)
print("The squareroot is :")
var result = calculateSquareroot.sqrt(no1: c!)

print(result)

