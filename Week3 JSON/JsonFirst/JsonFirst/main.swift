//
//  main.swift
//  JsonFirst
//
//  Created by admin on 04/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

//let stringToReturn = """
//
//{
//"Food Factory":{
//"id1":{
//"Name" : "Rice",
//"Price per kg" : 100,
//"Quantity in kg" : 2
//},
//"id2":{
//"Name" : "Pulses",
//"Price per kg" : 50,
//"Quantity in kg" : 2
//
//},
//"id3":{
//"Name" : "Wheat",
//"Price per kg" : 70,
//"Quantity in kg" : 2
//
//}
//}
//}
//"""
//
//
//let jsonPayload = stringToReturn.data(using: String.Encoding.utf8, allowLossyConversion: false)!
////print("ab=nything")
//do {
//    let json = try JSONSerialization.jsonObject(with: jsonPayload, options: [JSONSerialization.ReadingOptions.mutableContainers]) as! [String: AnyObject]
//
//    if let foodfactory = json["Food Factory"]{
//        //print("please")
//        if let id1 = foodfactory["id1"] as? [String: Any] {
//            //print("pleasedo")
//            if let name = id1["Name"] {
//                print("\(name) is the name")
//            }
//            if let priceperkg = id1["Price per kg"], let quantity = id1["Quantity in kg"]{
//
//                var resultotal = priceperkg as! Int * (quantity as! Int)
//                print(resultotal)
//            }
//        }
//        if let id2 = foodfactory["id2"] as? [String: Any] {
//            if let name2 = id2["Name"]{
//                print(name2)
//            }
//            if let priceperkgpulses = id2["Price per kg"] , let quantitypulses = id2["Quantity in kg"]{
//                var resulttotal2 = priceperkgpulses as! Int * (quantitypulses as! Int)
//                print(resulttotal2)
//            }
//        }
//        if let id3 = foodfactory["id3"] as? [String: Any] {
//            if let name3 = id3["Name"]{
//                print(name3)
//            }
//            if let priceperkgwheat = id3["Price per kg"] , let quantitywheat = id3["Quantity in kg"]{
//                var resulttotal3 = priceperkgwheat as! Int * (quantitywheat as! Int)
//                print(resulttotal3)
//            }
//        }
//    }
//
//
//} catch let error as Error {
//    print("Error")
//    print ("We encountered an error: \(error.localizedDescription)")
//}
//

struct Inventory : Codable {
    var name : String?
    var weight : Int?
    var price : Int?
}

let filePath = "/Users/admin/BridgeLabz/Week3 JSON/JsonFirst/abc.json"  // file path
let fileData = FileManager.default.contents(atPath: filePath)

print(fileData!)

let decoder = JSONDecoder()
do {
    let jsonDictionary : [String: [Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
       print(jsonDictionary)
    
    let myArrayOfRiceInventory = jsonDictionary["rice"]
    //print(myArrayOfInventory!)
    
    for singleInventory in myArrayOfRiceInventory! {
        print(singleInventory.price! * singleInventory.weight!)
        
        
    }
    
} catch let error {
    print(error.localizedDescription)
}
