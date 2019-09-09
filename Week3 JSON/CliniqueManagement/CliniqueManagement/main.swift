//
//  main.swift
//  CliniqueManagement
//
//  Created by admin on 07/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


let ido = inputdoc()
var result = ido.input()
var count = result.count
//print(result[2].name)
var doctorvisit = Array(repeating: [Int](), count: count)
//searchD(doc: result)
//print("To for")

print("Enter a for appointment")
var input = readLine()
var p :[patient] = []
var id = 0
while input == "a"
{
    print("Enter your name")
    var name = readLine()
    print("Enter your mobile no")
    var mobno = readLine()
    print("Enter your age")
    var age = Int(readLine()!)
    let p1 = patient(name: name!, id: id, mobno: mobno!, age:age! )
    //p.append(p1)
    print("Enter the doctor name you want to have an appointment with")
    var docname = readLine()
    var app = appoint(doc: result, docname: docname!, doctorvisit: &doctorvisit)
   // print(app)
    if app == "Appointment Fixed"
    {
        print(app)
        p.append(p1)
    }
    else
    {
        print(app)
    }
    id = id + 1
    print("If you want to exit press e otherwise press any character")
    var inputwhile = readLine()
    if inputwhile == "e"
    {
        break
    }
    else
    {
        continue
    }
}
print("Printing Patient details")
print("Name\tid\tMobNo\tage")
print("........................")
for i in 0..<p.count
{
    print("\(p[i].name!)\t\(p[i].id!)\t\(p[i].mobno!)\t\(p[i].age!)")
}
searchP(doc: p)




