//
//  main.swift
//  VendingMachine
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


print("Give a Change")
let input = readLine()
var change = Int(input!)
var count = 0
if change! == 0 || change! < 0
{
    print("Enter a valid amount which is greater than zero")
}
if change! >= 1000
{
    if change! % 1000 == 0
    {
        print("No of 1000 rs note needed is \(change!/1000)")
        count = count + change!/1000
        change = 0
    }
    else
    {
        var inter_change = change
        let div = inter_change!/1000
        print("No of 1000 rs note needed is \(div)")
        count = count + div
        inter_change = inter_change! - div * 1000
        change = inter_change
    }
}
   if change! >= 500
{
    
    
        if change! % 500 == 0
        {
            print("No of 500 rs note needed is \(change!/500)")
            count = count + change!/500
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/500
            print("No of 500 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 500
            change = inter_change
        }
    
    
}

    if change! >= 100
    {
        if change! % 100 == 0
        {
            print("No of 100 rs note needed is \(change!/100)")
            count = count + change!/100
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/100
            print("No of 100 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 100
            change = inter_change
        }
    
    }
    
    if change! >= 50
    {
        if change! % 50 == 0
        {
            print("No of 50 rs note needed is \(change!/50)")
            count = count + change!/50
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/50
            print("No of 50 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 50
            change = inter_change
        }
    }
    if change! >= 20
    {
        if change! % 20 == 0
        {
            print("No of 20 rs note needed is \(change!/20)")
            count = count + change!/20
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/20
            print("No of 20 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 20
            change = inter_change
        }
    }
   if change! >= 10
   {
        if change! % 10 == 0
        {
            print("No of 10 rs note needed is \(change!/10)")
            count = count + change!/10
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/10
            print("No of 10 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 10
            change = inter_change
        }
    }
    

    if change! >= 5
    {
        if change! % 5 == 0
        {
            print("No of 5 rs note needed is \(change!/5)")
            count = count + change!/5
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/5
            print("No of 5 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 5
            change = inter_change
        }
    
    }
    if change! >= 2
    {
        if change! % 2 == 0
        {
            print("No of 2 rs note needed is \(change!/2)")
            count = count + change!/2
            change = 0
        }
        else
        {
            var inter_change = change
            let div = inter_change!/2
            print("No of 2 rs note needed is \(div)")
            count = count + div
            inter_change = inter_change! - div * 2
            change = inter_change
        }
    
    }
    if change! == 1
    {
        print("No of 1 rs note needed is \(change!)")
        count = count + 1
    }

print("Total notes needed is \(count)")
