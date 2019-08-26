//
//  main.swift
//  OrderedList
//
//  Created by admin on 26/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

let location = NSString(string:"/Users/admin/Documents/Ordered.txt").expandingTildeInPath


do{
    let fileofcontent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
    print(fileofcontent)
}
catch{
    print("Not Found")
}
