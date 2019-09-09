//
//  main.swift
//  StockReport
//
//  Created by admin on 05/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


class Stock{
    
    var sharename : String?
    var shareprice : Double?
    public var numberofshares : Int?
    
    init(sharename : String , shareprice : Double , numberofshares : Int)
    {
        self.sharename = sharename
        self.shareprice = shareprice
        self.numberofshares = numberofshares
    }
    
    
}

class stockportfolio{
 
    var stock : Stock?
    init(stk: Stock) {
        self.stock = stk
    }
    
}

//var s = stock(sharename: "First", shareprice: 120.5, numberofshares: 5)
//print("Enter number of Stock to produce report")
//var noofstock = Int(readLine()!)
let s = Stock(sharename: "Sudipta", shareprice: 100.2, numberofshares: 5)
//print(s.sharename)
let ss = stockportfolio(stk: s)
print(ss.stock?.sharename)
