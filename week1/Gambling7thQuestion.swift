//
//  main.swift
//  7thQuestInvestment
//
//  Created by admin on 21/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

let name1 = readLine()
var stake = Int(name1!)
let name2 = readLine()
var goal = Int(name2!)
let name3 = readLine()
var count = Int(name3!)
var bet=0
var win = 0
var lose = 0
var i = 0
while i < count!
{
    var cash = stake
    while cash! > 0 && cash! < goal!
    {
        bet = bet + 1
        let fraction = Double.random(in: 0...1)
        if fraction < 0.5
        {
            cash = cash! + 1
        }
        else
        {
            cash = cash! - 1
        }
        if cash==goal
        {
            win = win + 1
        }
    }
    i = i + 1
}
var perwin = (Float(win)/Float(count!)) * 100
perwin = perwin.rounded()
var perwin1 = Int(perwin)
var perlose=(Float(count!-win)/Float(count!)) * 100
perlose = perlose.rounded()
var perlose1 = Int(perlose)
print("No of wins : \(win)")
print("Percentage of wins : \(perwin1)")
print("Percentage of loss : \(perlose1)")

