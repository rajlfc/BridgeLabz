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
    init(texttitle: String,textnote:String) {
        self.texttitle = texttitle
        self.textnote = textnote
    }
}
