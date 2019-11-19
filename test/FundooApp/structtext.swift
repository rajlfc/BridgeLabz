//
//  structtext.swift
//  FundooApp
//
//  Created by admin on 01/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit
class Image{
    var image: UIImage
    init(image: UIImage) {
        self.image = image
    }
}
class Text{
    var texttitle: String
    var textnote: String
    var important:Bool
    var index : Int
    var archive : Bool
    var id :String
    var color : UIColor
    init(texttitle: String,textnote:String,index:Int,important:Bool,archive:Bool,id:String,color:UIColor) {
        self.texttitle = texttitle
        self.textnote = textnote
        self.index = index
        self.important = important
        self.archive = archive
        self.id = id
        self.color = color
    }
}
