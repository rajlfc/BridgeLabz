//
//  main.swift
//  FinalTictacToe
//
//  Created by admin on 24/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func winUser( a:  [ [String] ]) -> Bool
{
    if a[0][0] == "x" && a[1][1] == "x" && a[2][2] == "x"
    {
        return true
    }
    else
    {
        if a[0][0] == "x" && a[0][1] == "x" && a[0][2] == "x" || a[1][0] == "x" && a[1][1] == "x" && a[1][2] == "x" || a[2][0] == "x" && a[2][1] == "x" && a[2][2] == "x" || a[0][0] == "x" && a[1][0] == "x" && a[2][0] == "x" || a[0][1] == "x" && a[1][1] == "x" && a[2][1] == "x" || a[0][2] == "x" && a[1][2] == "x" && a[2][2] == "x" || a[0][2] == "x" && a[1][1] == "x" && a[2][0] == "x"
        {
            
            return true
            
        }
        else
        {
            return false
        }
        
    }
    
}
func winComp(a: [ [String] ]) -> Bool
{
    if a[0][0] == "o" && a[1][1] == "o" && a[2][2] == "o"
    {
        return true
    }
    else
    {
        if a[0][0] == "o" && a[0][1] == "o" && a[0][2] == "o" || a[1][0] == "o" && a[1][1] == "o" && a[1][2] == "o" || a[2][0] == "o" && a[2][1] == "o" && a[2][2] == "o" || a[0][0] == "o" && a[1][0] == "o" && a[2][0] == "o" || a[0][1] == "o" && a[1][1] == "o" && a[2][1] == "o" || a[0][2] == "o" && a[1][2] == "o" && a[2][2] == "o" || a[0][2] == "o" && a[1][1] == "o" && a[2][0] == "o"
        {
            
            return true
            
        }
        else
        {
            return false
        }
        
    }
    
}
func draw(a: [ [String]])->Bool
{
    var i = 0
    //var j = 0
    var flag = 1
    while i < 3
    {
        var j = 0
        while j < 3
        {
            if a[i][j] != " "
            {
                flag = 0
                //print("\(i) \(j) \(flag)")
            }
            else
            {
                flag = 1
                //print("\(i) \(j) \(flag)")
                break
            }
            j = j + 1
        }
        if flag == 1
        {
            break
        }
        //print("i is \(i)")
        i = i + 1
    }
    if flag == 0
    {
        return true
    }
    else
    {
        return false
    }
}
var size = 3
var a:[[String]] = Array(repeating: Array(repeating: " ", count: size), count: size)
//print("int array:", intArray)
//a[0][0] = "x"
//var b = true


//var c = winUser(a: <#T##[[String]]#>)
while !winUser(a: a) && !winComp(a: a) && !draw(a: a)
{
    print("User turn")
    let name = readLine()
    var row = Int(name!)
    let name1 = readLine()
    var col = Int(name1!)
    
    
    //a[row!][col!] = "x"
    while a[row!][col!] != " "
    {
        print("Alraedy occupied Enter another cell")
      let input1 = readLine()
      row = Int(input1!)
      let input2 = readLine()
      col = Int(input2!)
    }
    a[row!][col!] = "x"
    print(a)
    if(winUser(a: a))
    {
        break
    }
    if(draw(a: a))
    {
        break
    }
    print("computer turn")
    var row1 = Int.random(in: 0...2)
    print(row1)
    var col1 = Int.random(in: 0...2)
    print(col1)
    
    while  a[row1][col1] != " "
    {
        row1 = Int.random(in: 0...2)
        print("New row is : \(row1)")
        col1 = Int.random(in: 0...2)
        print("New column is : \(col1)")
    }
    if(winComp(a: a))
    {
        break
    }
    a[row1][col1] = "o"
    print(a)
    if(winComp(a: a))
    {
        break
    }
    winUser(a: a)
    //print(winUser(a: a))
    winComp(a : a)
    //print(winComp(a: a))
    draw(a: a)
    //print(draw(a: a))
}
if winUser(a: a)
{
    print("User Wins")
}
else if winComp(a: a)
{
    print("Computer Wins")
}
else
{
    print("It is a draw")
}





