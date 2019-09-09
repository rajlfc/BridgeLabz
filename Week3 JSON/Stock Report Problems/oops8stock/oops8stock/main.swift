//
//  main.swift
//  oops8stock
//
//  Created by admin on 09/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Stockreport{
    var stock_symbol: String
    var nos_stock: Int
    init(stock_symbol: String, nos_stock: Int){
        self.stock_symbol = stock_symbol
        self.nos_stock = nos_stock
    }
}


class Node{
    var value: Stockreport
    var next: Node?
    init(value: Stockreport, next: Node?) {
        self.value = value
        self.next = next
    }
}

class linkedliststack {
    var time = linkedlistQueue()
    var head: Node?
    func add(_ value: Stockreport){
        var stocknamefortime = value.stock_symbol
        stocknamefortime.append(" added at ")
        time.add(stocknamefortime)
        if(head==nil){
            head = Node(value: value, next: nil)
            print("added stock symbol = \(value.stock_symbol)  no of stocks = \(value.nos_stock)")
            return
        }
        var current = head
        while(current?.next != nil){
            current = current?.next
        }
        current?.next = Node(value: value, next: nil)
        print("added stock symbol = \(value.stock_symbol)  no of stocks = \(value.nos_stock)")
    }
    func delete(){
        if(head==nil){
            print("no data in the stack")
            return
        }
        //var value: Stockreport
        var current=head
        var previous: Node?
        previous?.next = head
        while current?.next != nil {
            previous = current
            current = current?.next
        }
        var sname = current?.value.stock_symbol
        sname?.append(" deleted at ")
        time.add(sname!)
        previous?.next = nil
    }
    func display(){
        var current = head
        print("stock  no of stocks")
        while(current != nil){
            print("\((current?.value.stock_symbol)!)          \((current?.value.nos_stock)!)")
            current = current?.next
        }
        time.display()
    }
}



var stack = linkedliststack()
print("how many stocks do you want to add")
var nstocks = Int(readLine()!)
for i in 1...nstocks!{
    print("stock symbol")
    var symbol = String(readLine()!)
    print("no of stocks")
    var noOfStock = Int(readLine()!)
    var stock = Stockreport(stock_symbol: symbol, nos_stock: noOfStock!)
    stack.add(stock)
}
print("do you want to delete the most recent item press Y if yes")
var deletelast = String(readLine()!)
if(deletelast=="Y"){
    stack.delete()
}
stack.display()

