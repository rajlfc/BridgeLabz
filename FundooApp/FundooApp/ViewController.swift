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
    //var userid : String?
    var security : String?
    //var price : Int?
}


class ViewController: UIViewController {
    var myArrayofRiceInventory = [Inventory]()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imagetop: UIImageView!
    @IBOutlet weak var imagebelow: UIImageView!
    @IBOutlet weak var emailfield: UITextField!
        @IBOutlet weak var passfield: UITextField!
    @IBOutlet weak var imagefull: UIImageView!
    @IBOutlet weak var marqueefield: UIWebView!
    var flag = 1
    var str: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.view.sendSubviewToBack(imagetop)
        self.view.sendSubviewToBack(imagefull)
        
        
        
//         marqueefield.loadHTMLString("<html><body><marquee>Welcome to FundooNotes</marquee></body></html>", baseURL: nil)
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
    func pract()->String
    {
        return "Hi"
    }
    func checkemailpass()->Bool
    {
        for i in myArrayofRiceInventory{
            
            if emailfield.text == i.emailid && passfield.text == KeychainWrapper.standard.string(forKey: emailfield.text!)
            {
                return true
            }
            
        }
        return false
    }
    
    @IBAction func login(_ sender: Any) {
        
        if checkemailpass()
        {
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
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
    
    @IBAction func forgetPassword(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "ForgotPasswordVC")
        self.present(first, animated: true, completion: nil)
    }
    
}


