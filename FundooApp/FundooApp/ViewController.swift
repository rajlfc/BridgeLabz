//
//  ViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Foundation
struct Inventory : Codable {
    var emailid : String?
    var password : String?
    //var price : Int?
}


class ViewController: UIViewController {
    var myArrayofRiceInventory = [Inventory]()
    
    @IBOutlet weak var emailfield: UITextField!
    
    @IBOutlet weak var passfield: UITextField!
    var flag = 1
    var str: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let filePath = "/Users/admin/BridgeLabz/Week3 JSON/FundooApp/FundooApp/login.json"  // file path
        let fileData = FileManager.default.contents(atPath: filePath)
        let decoder = JSONDecoder()
        do{
            
            let jsonDictionary : [String: [Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
            myArrayofRiceInventory = jsonDictionary["details"]!
            
        }catch let error{
            print("Not Found")
        }
        
        //print(flag)
    }
    func checkemailpass()->Bool
    {
        for i in myArrayofRiceInventory{
            
            if emailfield.text == i.emailid && passfield.text == i.password
            {
                return true
            }
            
        }
        return false
    }
    
    @IBAction func login(_ sender: Any) {
        
        if checkemailpass()
        {
            performSegue(withIdentifier: "mysegue", sender: self)
        }
        else
        {
            let alertController:UIAlertController = UIAlertController(title: "Message", message: "EmailId or Password is incorrect", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func onRegister(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "ThirdVC")
        self.present(first, animated: true, completion: nil)
    }
    
    
}


