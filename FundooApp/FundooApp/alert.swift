//
//  alert.swift
//  FundooApp
//
//  Created by admin on 23/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
extension ThirdViewController{
    
//    func present(_ viewControllerToPresent: UIViewController,
//                 animated flag: Bool,
//                 completion: (() -> Void)? = nil){
//
//    }
    
    func alertsuccessfulregister()
    {
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Successfully registered", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func alertpasswordmissmatch()
    {
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Passwords dont match", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func alertemailverify()
    {
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Please Check your email id", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func alertemailstart()
    {
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Please Enter a valid email id", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func alertpasswordstrength()
    {
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Password Strength is weak please make a strong password", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension NoteOpenViewController{
    
    func alertDelete()
    {
        let alert = UIAlertController(title: "Success", message: "Deleted Note Sucessfully", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
extension UserDefaults {
    
    func color(forKey key: String) -> UIColor? {
        
        guard let colorData = data(forKey: key) else { return nil }
        
        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)
        } catch let error {
            print("color error \(error.localizedDescription)")
            return nil
        }
        
    }
    
    func set(_ value: UIColor?, forKey key: String) {
        
        guard let color = value else { return }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
            set(data, forKey: key)
        } catch let error {
            print("error color key data not saved \(error.localizedDescription)")
        }
        
    }
    

}

