//
//  main.swift
//  Prime2DArray
//
//  Created by admin on 28/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


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
print(a)
