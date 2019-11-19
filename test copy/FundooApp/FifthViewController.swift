//
//  FifthViewController.swift
//  FundooApp
//
//  Created by admin on 23/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
     var myArrayofRiceInventory = [Inventory]()
    var encoder = JSONEncoder()
    var myArrayofRiceInventory2 = [String:[Inventory]]()
    var getIndex = 0
    let filePath = "/Users/admin/BridgeLabz/Week3 JSON/FundooApp/FundooApp/login.json"
    @IBOutlet weak var newpass: UITextField!
    @IBOutlet weak var confirmpass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // file path
        let fileData = FileManager.default.contents(atPath: filePath)
        let decoder = JSONDecoder()
        
        do{
            
            let jsonDictionary : [String: [Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
            myArrayofRiceInventory = jsonDictionary["details"]!
            
        }catch let error{
            print("Not Found")
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onregisterpass(_ sender: Any) {
        
        if newpass.text! == confirmpass.text!
        {
            let fourth = FourthViewController()
           // let k = fourth.checkwhere()
           // print(k.0)
//            myArrayofRiceInventory[getIndex].password = newpass.text!
//            myArrayofRiceInventory2 = ["details": myArrayofRiceInventory]
//            do{   let jsondata = try encoder.encode(myArrayofRiceInventory2)
//            let url = URL(fileURLWithPath: filePath)
//            try jsondata.write(to: url)
//            }catch{
//
//            }
            KeychainWrapper.standard.set(newpass.text!, forKey: myArrayofRiceInventory[getIndex].emailid!)
            
            let alertController:UIAlertController = UIAlertController(title: "Message", message: "Password has been modified successfully", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                action in
                let main = UIStoryboard(name: "Main", bundle: nil)
                let first = main.instantiateViewController(withIdentifier: "FirstVC")
                self.present(first, animated: true, completion: nil)
            })
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
            let alertController:UIAlertController = UIAlertController(title: "Message", message: "Passwords do not match", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
