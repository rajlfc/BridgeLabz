//
//  main.swift
//  ExtensionDeckofCards
//
//  Created by admin on 06/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Deck{
    
    var spades : [String]?
    var diamonds : [String]?
    var hearts : [String]?
    var clubs : [String]?
    func decks(value : Int)->String{
        
        var spades = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
        var diamonds = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
        var hearts = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
        var clubs = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
        
        var type = value % 13
        var itr = value/13
        //String str = " "
        if itr == 0
        {
            var str = spades[type]
            str.append("S")
            return str
        }
        else if itr == 1
        {
            var str = diamonds[type]
            str.append("D")
            return str
        }
        else if itr == 2
        {
            
            var str = hearts[type]
            str.append("H")
            return str
        }
        else
        {
            var str = clubs[type]
            str.append("C")
            return str
        }
        
    }
    
}

class Players{
    
    var players = Array(repeating:" ",count: 9)
    var randomarray = Array(repeating: false, count: 53)
    func distribute()->[String]
    {
        for i in 0..<9
        {
            //print("for")
            var randomnumber = Int.random(in: 1...52)
            //print(randomnumber)
            if randomarray[randomnumber] == false
            {
                randomarray[randomnumber] = true
                let d = Deck()
                players[i] = d.decks(value: randomnumber)
                //print("\(i) \(players[i])")
            }
            else
            {
                while randomarray[randomnumber] != false
                {
                    //print("else")
                    randomnumber = Int.random(in: 1...52)
                    //print(randomnumber)
                }
                randomarray[randomnumber] = true
                let d = Deck()
                d.decks(value: randomnumber)
                players[i] = d.decks(value: randomnumber)
            }
            //if players.length ==
            
        }
        return players
    }
    
}

let pl = Players()

var result = Array(repeating: [String](), count: 4)

for i in 0..<4
{
    var num = pl.distribute()
    for j in 0..<num.count
    {
        result[i].append(num[j])
    }
}
print(result)


