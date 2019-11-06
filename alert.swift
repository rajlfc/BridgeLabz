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
extension FourthViewController{
    
    func alertsuccessfull(value:String)
    {
        let alert = UIAlertController(title: "Success", message: value, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func alertme(value:String)
    {
        let alertController:UIAlertController = UIAlertController(title: "Message", message: value, preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension UIColor {
    
    
    //Convert RGBA String to UIColor object
    //"rgbaString" must be separated by space "0.5 0.6 0.7 1.0" 50% of Red 60% of Green 70% of Blue Alpha 100%
    public convenience init?(rgbaString : String){
        self.init(ciColor: CIColor(string: rgbaString))
    }
    
    //Convert UIColor to RGBA String
    func toRGBAString()-> String {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(r) \(g) \(b) \(a)"
        
    }
    //return UIColor from Hexadecimal Color string
    public convenience init?(hexaDecimalString: String) {
        
        let r, g, b, a: CGFloat
        
        if hexaDecimalString.hasPrefix("#") {
            let start = hexaDecimalString.index(hexaDecimalString.startIndex, offsetBy: 1)
            let hexColor = hexaDecimalString.substring(from: start)
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    // Convert UIColor to Hexadecimal String
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(
            format: "#%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
