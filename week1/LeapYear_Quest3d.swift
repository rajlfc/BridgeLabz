//
//  main.swift
//  Third_LeapYear
//
//  Created by admin on 20/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

let name=readLine()
var len=name!.count
if(len==4)
{
    let num=Int(name!)
    let rem=num! % 100
    if(rem==0)
    {
        let rem1=num! % 400
        if(rem1==0)
        {
          print("Leap Year")
        }
        else
        {
            print("Not a Leap Year")
        }
    }
    else
    {
        let rem2=num! % 4
        if(rem2==0)
        {
            print("Leap Year")
        }
        else
        {
            print("Not a Leap Year")
        }
    }
}
else
{
    print("Enter a valid Year and try again")
}



