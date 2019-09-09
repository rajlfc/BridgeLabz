//
//  main.swift
//  practice
//
//  Created by admin on 06/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

var str1 = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
var str2 = ["5S", "AceD", "7S", "JackD", "4C", "8H", "2D", "QueenD", "QueenH"]
var str3 = [String]()
for i in 0..<str2.count
{
    if (!str2[i].hasPrefix("10") && !str2[i].hasPrefix("Q") && !str2[i].hasPrefix("A") && !str2[i].hasPrefix("K") && !str2[i].hasPrefix("J"))
    {
        str3.append(str2[i])
        str3.sort()
    }
    
}
print(str3)
//if str2.contains("10")
//{
    for i in 0..<str2.count
    {
        if(str2[i].hasPrefix("10"))
        {
            str3.append(str2[i])
        }
    }
//}
//else if str2.contains("Jack")
//{
    for i in 0..<str2.count
    {
        if(str2[i].hasPrefix("J"))
        {
            str3.append(str2[i])
        }
    }
//}
//else if str2.contains("Queen")
//{
    for i in 0..<str2.count
    {
        if(str2[i].hasPrefix("Q"))
        {
            str3.append(str2[i])
        }
    }
//}
//else if str2.contains("King")
//{
    for i in 0..<str2.count
    {
        if(str2[i].hasPrefix("K"))
        {
            str3.append(str2[i])
        }
    }
//}
 //       else if str2.contains("Ace")
  //      {
            for i in 0..<str2.count
            {
                if(str2[i].hasPrefix("A"))
                {
                    str3.append(str2[i])
                }
            }
 //       }
print(str3)
