//
//  main.swift
//  JsonFinal
//
//  Created by admin on 09/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

import Foundation

struct Inventory : Codable {
    var name : String?
    var weight : Int?
    var price : Int?
}


// /Users/bridgelabz/CustomFiles/myFile.json
let filePath = "/Users/admin/BridgeLabz/Week3 JSON/JsonFirst/abc.json"  // file path
let fileData = FileManager.default.contents(atPath: filePath)

print(fileData!)

let decoder = JSONDecoder()
do {
    let jsonDictionary : [String: [Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
    //    print(jsonDictionary)
    
    let myArrayOfRiceInventory = jsonDictionary["rice"]
    //    print(myArrayOfInventory!)
    
    var totalriceval = 0
    for singleInventory in myArrayOfRiceInventory! {
        totalriceval += singleInventory.price! * singleInventory.weight!
    }
      
     print("Total rice value is \(totalriceval)")
        
     var totalpulseval = 0
     
        let myArrayOfPulseInventory = jsonDictionary["pulses"]

        for singleInventory in myArrayOfPulseInventory! {
            totalpulseval += singleInventory.price! * singleInventory.weight!
    }
        print("Total pulses value is \(totalpulseval)")
            
    var totalwheatval = 0
    let myArrayOfWheatInventory = jsonDictionary["wheat"]
    
    for singleInventory in myArrayOfWheatInventory! {
        totalwheatval += singleInventory.price! * singleInventory.weight!
    }
    print("Total wheat value is \(totalwheatval)")
    
} catch let error {
    print(error.localizedDescription)
}


