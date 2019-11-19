//
//  InternetStatus.swift
//  FundooApp
//
//  Created by admin on 07/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}
