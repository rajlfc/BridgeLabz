//
//  main.swift
//  Newpractice
//
//  Created by admin on 06/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

print("Hello, World!")
var str2 = ["5S", "AceD", "7S", "JackD", "4C", "8H", "JackD","2D", "QueenD", "QueenH","JackH"]
var str3 = [String]()
var str10 = [String]()
var strJ = [String]()
var strK = [String]()
var strQ = [String]()
var strA = [String]()

for i in 0..<str2.count
{
    if (!str2[i].hasPrefix("10") && !str2[i].hasPrefix("Q") && !str2[i].hasPrefix("A") && !str2[i].hasPrefix("K") && !str2[i].hasPrefix("J"))
    {
        str3.append(str2[i])
        str3.sort()
    }
    if(str2[i].hasPrefix("10"))
    {
        str10.append(str2[i])
    }
    if(str2[i].hasPrefix("J"))
    {
        strJ.append(str2[i])
    }
    if(str2[i].hasPrefix("Q"))
    {
        strQ.append(str2[i])
    }
    if(str2[i].hasPrefix("K"))
    {
        strK.append(str2[i])
    }
    if(str2[i].hasPrefix("A"))
    {
        strA.append(str2[i])
    }


}
var strfinl = str3+str10+strJ+strQ+strK+strA
print(strfinl)
