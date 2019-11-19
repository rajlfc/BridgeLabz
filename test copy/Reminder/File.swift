//
//  File.swift
//  FundooApp
//
//  Created by admin on 16/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Reminderclass{
    
    var time:String?
    var date:String?
    var title:String?
    var uuid:String?
    
    init(time:String,date:String,title:String,uuid:String)
    {
        self.time = time
        self.date = date
        self.title = title
        self.uuid = uuid
    }
}
