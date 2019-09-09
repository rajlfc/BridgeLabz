//
//  main.swift
//  LinkedListmy
//
//  Created by admin on 04/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Snode<T>
{
    var value : T
    var next : Snode<T>?
    var prev : Snode<T>?
    init(value : T)
    {
        self.value = value
    }
}

class llist<T>
{
    var head : Snode<T>?
    //var prev : Snode<T>?
    func append(value : T)
    {
        var newnode = Snode<T>(value: value)
        //var h = head
        if head == nil
        {
            head = newnode
            head?.next = nil
        }
       
        else
        {
             var h = head
            while h?.next != nil
            {
                //prev = h
                h = h?.next
            }
            
            //head = newnode
            h?.next = newnode
            
            //h?.next = nil
        }
    }
    func reverse()
    {
        var h = head
        var n : Snode<T>?
        var p : Snode<T>?
        while h != nil
        {
            n = h?.next
            h?.next = p
            p = h
            h = n
        }
        head = p
        //print(p?.value)
    }
    func printlist()
    {
        var current = head
        while current != nil
        {
            print((current?.value)!)
            current = current?.next
        }
    }
}

let ll = llist<Int>()
for i in 0..<6
{
    ll.append(value: i)
}
ll.reverse()
ll.printlist()
