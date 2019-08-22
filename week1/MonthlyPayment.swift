//
//  main.swift
//  monthpay
//
//  Created by admin on 22/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class MonthlyPayment{
    
    static func payment(p : Int, r : Int , d : Int)->Double
    {
        let result = Double(p*r)/Double(1-d)
        return result
    }
    
}



let input1 = readLine()
print("Enter Principal")
var P = Int(input1!)
print("Enter Year")
let input2 = readLine()
var Y = Int(input2!)
print("Enter rate of interest")
let input3 = readLine()
var R = Int(input3!)

var r = R!/(12*100)
var n = 12*Y!
var divisor : Int = Int(pow(Double(1+r),Double(-n)))


var finalpayment = MonthlyPayment.payment(p: P!, r: r, d: divisor)

print(finalpayment)
