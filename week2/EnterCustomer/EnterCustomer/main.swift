//
//  main.swift
//  EnterCustomer
//
//  Created by admin on 29/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation



public class Snode< T, N > {
    var value: N
    var amount : T
    var next: Snode< T, N >?
    
    init( value: N , amt: T) {
        self.value = value
        self.amount = amt
    }
}

class Queue< T : Equatable, N: Equatable > {
    
    var head: Snode<T, N>?
    
    func enqueue( value: N, amt: T) {
        let newNode = Snode(value: value, amt: amt)
        if head != nil {
            head?.next = newNode
        } else {
            head = newNode
        }
    }
    
    func dequeue() {
        var h = head?.next
        var temp = head
        if head == nil {
            print("Queue is empty")
        }
        while h?.next != nil {
            temp = h
            h = h?.next
        }
        h?.next = nil
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    func size() -> Int {
        var count = 0
        var h = head
        while h?.next != nil {
            h = h?.next
            count += 1
        }
        return count
    }
    
}

let q = Queue<Float,Int>()

print("Enter number of customer")

let input = readLine()
var n = Int(input!)

var amount: Float = 0

for i in 0..<n!
{
    print("You want to choose which one")
    print("0 for deposit and 1 for withdraw")
    
    let choice = Int(readLine()!)
    
    print("Enter amount")
    
    let amount_choice = Float(readLine()!)
    
    if choice == 0
    {
        amount = amount + amount_choice!
    }
    else
    {
        amount = amount - amount_choice!
    }
    q.enqueue(value: choice!, amt: amount_choice!)
}

let size = q.size()

for i in 0..<size
{
    q.dequeue()
}

if amount < 0
{
    print("Not Balanced")
}
else
{
    print("Not balanced")
}
