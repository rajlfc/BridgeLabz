//
//  main.swift
//  addressbookfinal
//
//  Created by admin on 10/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

var p = printaddrbook()
var result = p.printaddr()


print("First_Name\tLast_Name\taddress\tcity\tphoneno.\tzipcode")
for i in 0..<result.count
{
      print("\(result[i].first_name!) \(result[i].last_name!) \(result[i].adddr!) \(result[i].city!) \(result[i].phoneno!) \(result[i].zipcode!)")
}




