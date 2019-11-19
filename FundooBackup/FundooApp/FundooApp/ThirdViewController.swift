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
    //@IBOutlet weak var PassField: UITextField!
    
    @IBOutlet weak var password: UITextField!
    //@IBOutlet weak var Passfield: UITextField!
    @IBOutlet weak var useridfield: UITextField!
    @IBOutlet weak var ConfirmPassField: UITextField!
    @IBOutlet weak var securityfield: UITextField!
    var emailverify : Int?
    var passverify : Int?
    var myArrayofRiceInventory = [Inventory]()
    var myArrayofRiceInventory2 = [String:[Inventory]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        

        // Do any additional setup after loading the view.
        EmailField.tag = 1001
        password.tag = 1002
//        KeychainWrapper.standard.set(PassField.text!, forKey: EmailField.text!)
     }
    @IBAction func passwordverify(_ sender: UITextField) {
        
        if sender.tag == 1002
        {
            if Validation.shared.isValidPass(passStr: password.text!)
            {
                passverify = 1
                let alertController:UIAlertController = UIAlertController(title: "Message", message: "Password Strength is Strong", preferredStyle: UIAlertController.Style.alert)
                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
                print(passverify)
            }
            else
            {
                passverify = 0
                let alertController:UIAlertController = UIAlertController(title: "Message", message: "Password Strength is weak please make a strong password", preferredStyle: UIAlertController.Style.alert)
                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
                print(passverify)
            }
        }
    }
    
    @IBAction func alertPassword(_ sender: Any) {
        
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Password should be minimum 8 characters long and 1 uppercase 1 lowercase 1 special character and 1 numeric", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
//    @IBAction func passwordverify(_ sender: UITextField) {
//
//
//
//
//    }
    @IBAction func emailverify(_ sender: UITextField) {
        
        //alertemailstart()
        if sender.tag == 1001
        {
            if Validation.shared.isValidEmail(emailStr: EmailField.text!)
            {
                emailverify = 1
                let alertController:UIAlertController = UIAlertController(title: "Message", message: "Email Verified", preferredStyle: UIAlertController.Style.alert)
                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
            else
            {
                emailverify = 0
                let alertController:UIAlertController = UIAlertController(title: "Message", message: "Email not supported", preferredStyle: UIAlertController.Style.alert)
                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
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
    @IBAction func onsave(_ sender: Any) {

        let filepath = "/Users/admin/BridgeLabz/Week3 JSON/FundooApp/FundooApp/login.json"
        let fileData = FileManager.default.contents(atPath: filepath)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        if password.text == ConfirmPassField.text  && emailverify == 1 && passverify == 1
        {
            let d1 = Inventory(emailid: EmailField.text!,security: securityfield.text!)
            do{

                let jsonDictionary : [String :[Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
                myArrayofRiceInventory = jsonDictionary["details"]!
                myArrayofRiceInventory.append(d1)
                KeychainWrapper.standard.set(password.text!, forKey: EmailField.text!)
                myArrayofRiceInventory2 = ["details": myArrayofRiceInventory]
                let jsondata = try encoder.encode(myArrayofRiceInventory2)
                let url = URL(fileURLWithPath: filepath)
                try jsondata.write(to: url)
                   alertsuccessfulregister()


            }catch let error{
                print("Not Found")
            }
        }
        else if password.text != ConfirmPassField.text
        {
            alertpasswordmissmatch()
        }
        else if emailverify == 0
        {
            alertemailverify()
        }
        else if passverify == 0
        {
            alertpasswordstrength()
        }

    }
    
    @IBAction func gotologin(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "FirstVC")
        self.present(first, animated: true, completion: nil)
    }
    
}
