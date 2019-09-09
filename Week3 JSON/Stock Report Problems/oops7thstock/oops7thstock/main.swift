//
//  main.swift
//  oops7thstock
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
    var head: Node?
    func add(_ value: Stockreport){
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
        //         print("deleted stock symbol = \(current.stock_symbol)  no of stocks = \(current.nos_stock)")
        previous?.next = nil
    }
    func display(){
        var current = head
        print("stock  no of stocks")
        while(current != nil){
            print("\((current?.value.stock_symbol)!)          \((current?.value.nos_stock)!)")
            current = current?.next
        }
    }
}

var stock = Stockreport(stock_symbol: "A", nos_stock: 20)
var stack = linkedliststack()
stack.add(stock)
stock = Stockreport(stock_symbol: "B", nos_stock: 30)
stack.add(stock)
stock = Stockreport(stock_symbol: "C", nos_stock: 40)
stack.add(stock)
stack.display()
stack.delete()
stack.display()

