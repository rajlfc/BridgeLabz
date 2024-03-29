//
//  getNotes.swift
//  FundooApp
//
//  Created by admin on 02/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import CoreData
class fetchnotes{
    var notelist = [Text]()
    var returnlist = [Text]()
    func getNotes(_ callback: @escaping (_ medicineTypes:[Text]?)->Void)->Void{
        

        var id = UserDefaults.standard.string(forKey: "idforlogin")
    AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/getNotesList?access_token="+id!,
                   method: .get
                   //parameters: login,
        /*encoder: JSONParameterEncoder.default*/).responseJSON { (response/*: AFDataResponse<[Text]>*/) in
                    
//                    if let data = response.data{
//                        guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                            else{
//                                print("failed here")
//                                return
//                        }
//                        if let JSON = json as? [String:Any]{
//                            //  labelHeader.text = JSON["title"] as? String
//                            var id = JSON["id"] as? String
//                            print(id)
//                            //var success = JSON["success"] as? Int
//                            //print(success)
//                            if id != nil{
//
//                                self.performSegue(withIdentifier: "mysegue", sender: self)
//                            }
//                            else
//                            {
//                                let alertController:UIAlertController = UIAlertController(title: "Message", message: "EmailId or Password is incorrect", preferredStyle: UIAlertController.Style.alert)
//                                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
//                                alertController.addAction(alertAction)
//                                self.present(alertController, animated: true, completion: nil)
//                            }
//                        }
//                    }
                    if let data = response.data{
                            guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
                            else{
                                  print("failed here")
                                return
                        }
                        if let JSON = json as? [String:Any]{
                           
                            if let success = JSON["data"] as?[String:Any]{
                                var array = (success["data"]! as! NSArray).mutableCopy() as! NSMutableArray as![Any]
                                var noofNotes:Int = (array.count ?? 0)
                                for i in 0..<noofNotes{
                                    var jsonLast = array[i]
                                    if let JSON3 = jsonLast as? [String:Any]{
                                        let title = JSON3["title"] as? String
                                        let description = JSON3["description"] as? String
                                        let color = JSON3["color"]
                                        let isArchived = JSON3["isArchived"] as! Bool
                                        let id = JSON3["id"] as! String
                                        let isPined = JSON3["isPined"] as! Bool
                                       // print("\(title) \(description) \(color) \(id) \(isArchived) \(isPined)")
                                       // self.notelist.append(Text(texttitle: title!, textnote: description!, index: i, important: isPined, archive: isArchived, id: id, color:self.hexStringToUIColor(hex: color as! String)))
                                        self.save(Text(texttitle: title!, textnote: description!, index: i, important: isPined, archive: isArchived, id: id, color:self.hexStringToUIColor(hex: color as! String)))
                                       // print("printing.....................68\(self.notelist.count)")
                                        UserDefaults.standard.set(id, forKey: "idfornote")
                                        UserDefaults.standard.set(title,forKey: "titlefornote")
                                    }
                                    
                                }
                            }
                            
                        }
                    
        }
        //debugPrint(response)
                    self.returnlist = self.notelist
                    //print("\\\\\\\\\\81 \(self.returnlist.count)")
           // print("callbackkkkkkkkkkkkk")
            callback(self.notelist)
    }
        //print("\\\\78")
        //print("printing.....................I am Raj\(self.returnlist.count)")
        //return notelist
        //return notelist
  }
    func save(_ data:Text){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
                let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
                newUser.setValue(data.texttitle, forKey: "title")
                newUser.setValue(data.textnote, forKey: "note")
                newUser.setValue(data.archive, forKey: "archive")
                //print("mark is \(mark)")
                //if mark
                //{
                    newUser.setValue(data.important, forKey: "important")
                    newUser.setValue(data.id, forKey: "id")
                    newUser.setValue(data.color.encode(),forKey: "color")
                //}
                //newUser.setValue("1", forKey: "age")
                let defaults = UserDefaults.standard
                var array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
                var count = array.count
                array.append(count)
                UserDefaults.standard.removeObject(forKey: "Index")
                defaults.set(array, forKey: "Index")
        
                do {
                    try context.save()
                } catch {
                    print("Failed saving")
                }
    }
  
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

