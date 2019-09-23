//
//  ThirdViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit



class ThirdViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var ConfirmPassField: UITextField!
    var myArrayofRiceInventory = [Inventory]()
    var myArrayofRiceInventory2 = [String:[Inventory]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        

        // Do any additional setup after loading the view.
     }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onsave(_ sender: Any) {

        let filepath = "/Users/admin/BridgeLabz/Week3 JSON/FundooApp/FundooApp/login.json"
        let fileData = FileManager.default.contents(atPath: filepath)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        if PassField.text == ConfirmPassField.text 
        {
            let d1 = Inventory(emailid: EmailField.text!, password: PassField.text!)
            do{

                let jsonDictionary : [String :[Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
                myArrayofRiceInventory = jsonDictionary["details"]!
                myArrayofRiceInventory.append(d1)

                myArrayofRiceInventory2 = ["details": myArrayofRiceInventory]
                let jsondata = try encoder.encode(myArrayofRiceInventory2)
                let url = URL(fileURLWithPath: filepath)
                try jsondata.write(to: url)
                
                let alertController:UIAlertController = UIAlertController(title: "Message", message: "Successfully registered", preferredStyle: UIAlertController.Style.alert)
                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
                

            }catch let error{
                print("Not Found")
            }
        }
        else
        {
            let alertController:UIAlertController = UIAlertController(title: "Message", message: "Passwords do not match", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }

    }
    
    @IBAction func gotologin(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "FirstVC")
        self.present(first, animated: true, completion: nil)
    }
    
}
