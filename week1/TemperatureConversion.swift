//
//  main.swift
//  TemperatureConvert
//
//  Created by admin on 23/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Celsius
{
    static func temperatureConvertion(temp : Double)->Double
    {
        let result = (temp * 9/5) + 32
        return result
    }
}
class Farenheight{
    
    static func temperatureConversion(temp : Double)->Double
    {
          let result = (temp-32) * 5/9
          return result
    }
}

print("Temperature is celsius then press c or farenheight for f")

let input = readLine()
if input == "c"
{
    print("Enter temperature")
    let cel = readLine()
    let got = Double(cel!)
    let celsius = Celsius.temperatureConvertion(temp: got!)
    let finalcelsius = Int(celsius)
    print("The converted temperature in farenheight is \(finalcelsius)")
}
else
{
    print("Enter temperature")
    let far = readLine()
    let got = Double(far!)
    let farenheight = Farenheight.temperatureConversion(temp: got!)
    let finalfarenheight = Int(farenheight)
    print("The converted temperature in celsius is \(finalfarenheight)")
}


