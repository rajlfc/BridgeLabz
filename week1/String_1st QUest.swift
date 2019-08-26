//
//  main.swift
//  first_String
//
//  Created by admin on 20/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func input()->String{
    let keyboard=FileHandle.standardInput
    let inputData=keyboard.availableData
    return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String
    
    
}

var str=input()
print("Hello \(str)How are you?")
