//
//  main.swift
//  Anagram
//
//  Created by admin on 22/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Anagram
{
    static func isAnagram(name1 : String , name2 : String)->Bool
    {
        var status  = true
        if name1.count != name2.count
        {
            return false
        }
        
        var fname1 = name1.lowercased()
        var fname2 = name2.lowercased()
        
        let sortedString1 = String(fname1.sorted())
        let sortedString2 = String(fname2.sorted())
        
        status = (sortedString1 == sortedString2)
        
        if(status)
        {
            return true
        }
        else
        {
            return false
        }
        
    }
}

print("Enter 1st String")
let name1 = readLine()

print("Enter 2nd String")
let name2 = readLine()

//let result = Anagram()
var statusresult = Anagram.isAnagram(name1:  name1!, name2:  name2!)

if(statusresult)
{
    print("Two Strings are Anagram of each other")
}
else
{
    print("Two Strings are not Anagram of each other")
}



