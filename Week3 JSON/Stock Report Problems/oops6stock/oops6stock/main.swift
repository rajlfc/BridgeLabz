//
//  main.swift
//  oops6stock
//
//  Created by admin on 09/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class CompanyShares {
    var stock_name: String
    var shares: Int
    init(stock_name: String,shares: Int){
        self.stock_name = stock_name
        self.shares = shares
    }
}

class Node{
    var value: CompanyShares
    var next:Node?
    init(value: CompanyShares, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList{
    var head: Node?
    func add(_ value: CompanyShares){
        if(head==nil){
            head = Node(value: value, next: nil)
            return
        }
        var current = head
        while(current?.next != nil){
            current = current?.next
        }
        current?.next = Node(value: value, next: nil)
    }
    
    func delete(_ Value: CompanyShares){
        if(head==nil){
            return
        }
        var current = head
        var previous: Node?
        while (current?.value.stock_name != Value.stock_name) {
            previous = current
            current = current?.next
        }
        previous?.next = current?.next
        
        
    }
    func display(){
        var current = head
        while(current != nil){
            print("\((current?.value.stock_name)!)   \((current?.value.shares)!)")
            current = current?.next
        }
    }
}
var ll = LinkedList()
print("enter the no of companies")
var NoOfcompanies = Int(readLine()!)
for i in 0..<NoOfcompanies!{
    print("stockname and no of stocks")
    var sname = String(readLine()!)
    var nStocks = Int(readLine()!)
    var cs = CompanyShares(stock_name: sname, shares: nStocks!)
    ll.add(cs)
}

//print(cs.stock_name)

ll.display()

