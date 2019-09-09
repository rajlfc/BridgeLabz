//
//  main.swift
//  OopsStock5
//
//  Created by admin on 09/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class CompanyShares{
    var stock_symbol: String
    var nos_stock = 0
    var value: Double
    init(stock_symbol: String, value: Double){
        self.stock_symbol = stock_symbol
        self.value = value
    }
}
class StockAccount{
    var amount:Double = 0
    var strStockData = String()
    func buy(_ stockreport: CompanyShares){
        strStockData.append("Buying \(stockreport.stock_symbol) share value \(stockreport.value)\n")
        amount += stockreport.value
    }
    func sell(_ stockreport: CompanyShares){
        strStockData.append("Selling \(stockreport.stock_symbol) share value \(stockreport.value)\n")
        amount -= stockreport.value
    }
    func save(){
        let saveToPath = "/Users/admin/Desktop/stock.txt"
        do{
            try strStockData.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
        }catch{
            print("pls check code")
        }
    }
    func printReport(){
        print(strStockData)
        print("the total value of stock now is \(amount)")
    }
}
var transations = StockAccount()
var stockrep = CompanyShares(stock_symbol: "A",value: 40)
transations.buy(stockrep)
stockrep = CompanyShares(stock_symbol: "B",  value: 50)
transations.buy(stockrep)
stockrep = CompanyShares(stock_symbol: "C", value: 60)
transations.buy(stockrep)
stockrep = CompanyShares(stock_symbol: "A",value: 70)
transations.sell(stockrep)
transations.save()
transations.printReport()

