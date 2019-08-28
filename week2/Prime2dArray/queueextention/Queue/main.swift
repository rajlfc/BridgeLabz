//
//  main.swift
//  Queue
//
//  Created by admin on 28/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
public class Node<T> {
    
    var item : T
    var next : Node?
    
    init(item:T)
    {
        self.item = item
    }
}
public class queueLL<T : Equatable>
{
    
    var head: Node<T>?
    var count = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    public var size : Int{
        
        return count
    }
    func enqueue(item: T)
    {
//        let oldhead = head
//        head = Node(item: item)
//        head!.next = oldhead
//        count = count + 1
        
         let newnode = Node(item: item)
         //oldhead = Node(item: item)
        
        if var oldhead = head{
            
            let newNode = Node(item: item)
            if var h = head {
                while h.next != nil {
                    h = h.next!
                }
                h.next = newNode
                
            } else {
                head = newNode
            }
        }
        else
        {
            head = newnode
        }
        
        
    }
    func printlist()
    {
        var h = head
        
        while h != nil
        {
            print(h!.item)
            h = h?.next
        }
    }
    
}

func toArray(a : Int)->[Int]
{
    var num = a
    var array = [Int]()
    while num != 0
    {
        var rem = num % 10
        array.append(rem)
        num = num/10
    }
    array.reverse()
    array.sort()
    return array
}

func Anagram(a :inout [[Int]],b : inout [[Int]])
{
    var i = 0
    var j = 1
    var m = 0
    var n = 0
    
    var size1 = a[m].count
    while n != 10
    {
        var l = 0
        //print("size outside \(a[m].count)")
        while l != a[m].count
        {
            //print("l = \(l)")
            //print("size is \(a[m].count)")
            var flag = 1
            if(l+1 != a[m].count)
            {
                for k in l+1..<a[m].count
                {
                    var result1 = toArray(a: a[n][l])
                    //print(k)
                    var result2 = toArray(a: a[n][k])
                    //print(a[n][k])
                    if result1 == result2
                    {
                        //print("Iffffffffffffffffffffff")
                        flag = 0
                        b[i].append(a[n][l])
                        b[i].append(a[n][k])
                        //print(k)
                        //print(a[n][k])
                        a[n].remove(at: k)
                        size1 = a[n].count
                        //print(size1)
                        //print(a[n][k])
                        break
                    }
                }
                if flag == 1
                {
                    b[j].append(a[n][l])
                }
            }
            else
            {
                b[j].append(a[n][l])
            }
            l = l + 1
        }
        n = n + 1
        m = m + 1
    }
    
}

func primeno(a : inout [[Int]],no1 : inout Int,no2 : Int,no3 : Int)
{
    if no1 == 0 && no2 == 100
    {
        a[no3].append(2)
    }
    //var j = 2
    //var flag = 1
    if no1 == 0
    {
        no1 = 3
    }
    for i in no1..<no2
    {
        var j = 2
        var flag = 1
        while j < i
        {
            if i % j == 0
            {
                flag = 0
                break
            }
            else
            {
                j = j + 1
            }
        }
        //print(flag)
        //print(i)
        if flag == 1
        {
            a[no3].append(i)
        }
        else
        {
            continue
        }
    }
}


var a = Array(repeating: [Int](), count: 10)
var b = Array(repeating: [Int](), count: 2)
var i = 0
var size1  = 0
var size2 = 100

while i < 10
{
    
    primeno(a: &a, no1: &size1, no2: size2, no3: i)
    size1 = size1 + 100
    size2 = size2 + 100
    i = i + 1
    
}
Anagram(a: &a, b: &b)
print(b)

let input = queueLL<Int>()
for j in 0..<b[0].count
{
    input.enqueue(item: b[0][j])
}
input.printlist()






