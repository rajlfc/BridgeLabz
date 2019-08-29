//
//  main.swift
//  BalancedParen
//
//  Created by admin on 29/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class stack {
    
    var top = -1
    var items = Array<Character>(repeating: " ", count: 100)
    
    func push(item : Character)
    {
        if top == 99
        {
            print("Stack is Full")
        }
        else
        {
            top = top+1
            items[top] = item
        }
        
    }
    func pop()->Character
    {
        //Character c = 'U'
        if top == -1
        {
            return "c"
        }
        else
        {
            var element = items[top]
            top = top - 1
            return element
        }
    }
    func isEmpty()->Bool
    {
        if top == -1
        {
            return true
        }
        else
        {
            return false
        }
    }
    func ismatchingpair(item1:Character,item2:Character)->Bool
    {
        if item1 == "(" && item2 == ")"
        {
            return true
        }
        else if item1 == "{" && item2 == "}"
        {
            return true
        }
        else if item1 == "[" && item2 == "]"
        {
            return true
        }
        else
        {
            return false
        }
    }
    func parenbal(a : [Character])->Bool
    {
        
        for i in 0..<a.count
        {
            if a[i] == "(" || a[i] == "{" || a[i] == "["
            {
                push(item: a[i])
            }
            if a[i] == ")" || a[i] == "}" || a[i] == "]"
            {
                if isEmpty()
                {
                    return false
                }
                else if (!ismatchingpair(item1: pop(), item2: a[i]))
                {
                    return false
                }
            }
        }
        
        if isEmpty()
        {
            return true
        }
        else
        {
            return false
        }
    }
}

print("Enter Arithmatic Expression")

var input = readLine()

var characters = Array(input!)
//print(characters)

let st = stack()

if st.parenbal(a: characters)
{
    print("Balanced")
}
else
{
    print("Not balanced")
}



