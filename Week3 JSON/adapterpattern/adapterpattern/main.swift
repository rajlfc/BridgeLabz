//
//  main.swift
//  adapterpattern
//
//  Created by admin on 12/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

public func testObjectAdapter(){
    
    let socket = socketadpaterimpl()
    var v3 : volt = getVolt(volts: socket, value: 3)
    var v12 : volt = getVolt(volts: socket, value: 12)
    var v120 : volt = getVolt(volts: socket, value: 120)
    
    print("v3 volts using Object Adapter=", +v3.getVolts())
    print("v3 volts using Object Adapter=", +v12.getVolts())
    print("v3 volts using Object Adapter=", +v120.getVolts())
}


 func getVolt(volts:SocketAdapter,value:Int)->volt
{
    switch(value)
    {
        case 3 :  return volts.get3volt()
        case 12 : return volts.get12volt()
        case 120 : return volts.get120volt()
        default :  return volts.get120volt()
    }
}

let result = testObjectAdapter()
//print(result)
