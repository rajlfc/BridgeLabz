//
//  main.swift
//  Strategypattern.swift
//
//  Created by admin on 12/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

var logger = Logger(strategy: CapitalizedStrategy())
logger.log("my first strategy")

logger = Logger(strategy: UppercaseStratgy())
logger.log("my first strategy")
logger = Logger(strategy: LowercaseStrategy())
logger.log("my first strategy")  

