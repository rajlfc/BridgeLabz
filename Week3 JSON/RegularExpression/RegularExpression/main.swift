//
//  main.swift
//  RegularExpression
//
//  Created by admin on 04/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

let location = NSString(string:"/Users/admin/BridgeLabz/Week3 JSON/RegularExpression/input.txt").expandingTildeInPath


do {

    var fileContent: String = try NSString( contentsOfFile: location, encoding: String.Encoding.utf8.rawValue ) as String
    //print(fileContent)

    //fileContent.replacingOccurrences(of: #"<<name>>"#, with: "Sudipta")
    
    let date = Date()
    let format = DateFormatter()
    format.dateFormat = "dd-MM-yyyy"
    let formattedDate = format.string(from: date)
    //print(formattedDate)
    
    
    fileContent = fileContent.replacingOccurrences(of: #"<<name>>"#, with: "Sudipta")
    fileContent = fileContent.replacingOccurrences(of: #"<<full name>>"#, with: "Sudipta Bhattacharjee")
    fileContent = fileContent.replacingOccurrences(of: #"91-xxxxxxxxxx"#, with: "9836744302")
    fileContent = fileContent.replacingOccurrences(of: #"01/01/2016"#, with: formattedDate)
    
    print(fileContent)
}
catch let error {
    print( error.localizedDescription )
}

