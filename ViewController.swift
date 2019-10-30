//
//  ViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Foundation
import GoogleSignIn
import FacebookCore
import FacebookLogin
struct Inventory : Codable {
    var emailid : String?
    //var userid : String?
    var security : String?
    //var price : Int?
}


class ViewController: UIViewController,GIDSignInDelegate {
    @IBOutlet weak var signinbutton: UIButton!
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
         print("sudiptogjggugug")
        if let error = error{
            print("We have a problem signin \(error.localizedDescription)")
        }
        else{
//            if let gmailuser = user{
//                //signinbutton.setTitle("Sign Out", for: .normal)
//                let main = UIStoryboard(name: "Main", bundle: nil)
//                let first = main.instantiateViewController(withIdentifier: "SecondVC")
//                //performSegue(withIdentifier: "mysegue", sender: self)
//                GIDSignIn.sharedInstance()?.presentingViewController = first
//                print("sign in")
//                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
//                UserDefaults.standard.synchronize()
//                //performSegue(withIdentifier: "mysegue", sender: self)
//
//
//                //signinbutton.setImage(UIImage(named: "GoogleSignOut"), for: .normal)
//            }
            print("sudipto")
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
//            let main = UIStoryboard(name: "Main", bundle: nil)
//            let first = main.instantiateViewController(withIdentifier: "SecondVC")
//            self.present(first, animated: true, completion: nil)
            performSegue(withIdentifier: "mysegue", sender: self)
        }
    }
    
    var myArrayofRiceInventory = [Inventory]()
    
    
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imagetop: UIImageView!
    @IBOutlet weak var imagebelow: UIImageView!
    @IBOutlet weak var emailfield: UITextField!
        @IBOutlet weak var passfield: UITextField!
    @IBOutlet weak var imagefull: UIImageView!
    @IBOutlet weak var marqueefield: UIWebView!
    var sizeclass:Bool?
    var flag = 1
    var str: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signinbutton.addTarget(self, action: #selector(SigninUserUsingGoogle(_:)), for: .touchUpInside)
        //self.view.sendSubviewToBack(imagetop)
        imagefull.image = UIImage(named: "Image-3")?.alpha(0.4)
        self.view.sendSubviewToBack(imagefull)
        //[emailfield setBackgroundColor:[UIColor clearColor]];
        emailfield.setPadding()
        emailfield.setBottomBorder()
       // emailfield.backgroundColor = UIColor(patternImage: (UIImage(named: "Image-3")!.alpha(0.4)))
        passfield.setPadding()
        passfield.setBottomBorder()
        print("sjfdjsdfhsjkdhfdjskhfjksdhfkjsdh")
        print(sizeclass)
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
    
    @objc func SigninUserUsingGoogle(_ sender:UIButton)
    {
//        if signinbutton.image(for: .normal) == UIImage(named:"GoogleSignOut")
//        {
//            GIDSignIn.sharedInstance()?.signOut()
//            //signinbutton.setTitle("Sign in Using Google", for: .normal)
//            signinbutton.setImage(UIImage(named: "GoogleSignin"), for: .normal)
//        }
//        else{
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let first = main.instantiateViewController(withIdentifier: "SecondVC")
            GIDSignIn.sharedInstance()?.delegate = self as! GIDSignInDelegate
            GIDSignIn.sharedInstance()?.presentingViewController = self
            print("abc")
            //GIDSignIn.sharedInstance().uidelegate = self
            GIDSignIn.sharedInstance()?.signIn()
        print("efg")
            
        //}
        
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
    
    @IBAction func loginbutton(_ sender: Any) {
        
        performSegue(withIdentifier: "mysegue", sender: self)
    }
    
    
    @IBAction func onnext(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "savenotevc")
        self.present(first, animated: true, completion: nil)
    }
    @IBAction func loginfacebook(_ sender: Any) {

        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile,.email], viewController: self){(result) in
            switch result{

            case .cancelled:
                break
            case .failed(let error):
                print("Login failed with error = \(error.localizedDescription)")
            case .success(let granted, let declined, let token):
                print("Access token = \(token)")
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                let main = UIStoryboard(name: "Main", bundle: nil)
                let first = main.instantiateViewController(withIdentifier: "SecondVC")
                self.present(first, animated: true, completion: nil)
//                performSegue(withIdentifier: "mysegue", sender: self)
                
    }
  }
 }
    func getuserprofile(){
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/me", parameters: ["fields":"id,name,birthday,email"], tokenString: AccessToken.current, version: , httpMethod: .get))
    }
}
extension  UIImage {
    
    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
}
extension UITextField {
    
    func setPadding(){
        
        let paddingview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingview
        self.rightView = paddingview
    }
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

