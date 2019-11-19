//
//  FourthViewController.swift
//  FundooApp
//
//  Created by admin on 23/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import MessageUI
import Alamofire

struct Email:Encodable{
    
    let email : String
    
}
class FourthViewController: UIViewController {

    @IBOutlet weak var emailfieldtocheck: UITextField!
    @IBOutlet weak var security: UITextField!
     var itr = 0
    var myArrayofRiceInventory = [Inventory]()
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
    }
    
//    @IBAction func ongo(_ sender: Any) {
//
//        if !MFMailComposeViewController.canSendMail() {
//            print("SMS services are not available")
//        }
//        else
//        {
//            print("OK")
//        }
//
//        if (MFMessageComposeViewController.canSendText()) {
//            print("In")
////            let controller = MFMessageComposeViewController()
////            controller.body = "Message Body"
////            controller.recipients = [emailfieldtocheck.text] as! [String]
////            controller.messageComposeDelegate = self as! MFMessageComposeViewControllerDelegate
////            self.present(controller, animated: true, completion: nil)
////        }
//        let messageVC = MFMessageComposeViewController()
//        messageVC.body = "Enter a message details here";
//        messageVC.recipients = ["9836744302"]
//        messageVC.messageComposeDelegate = self
//        self.present(messageVC, animated: true, completion: nil)
//    }
// }
//
//    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
//        switch (result) {
//        case .cancelled:
//            print("Message was cancelled")
//            dismiss(animated: true, completion: nil)
//        case .failed:
//            print("Message failed")
//            dismiss(animated: true, completion: nil)
//        case .sent:
//            print("Message was sent")
//            dismiss(animated: true, completion: nil)
//        default:
//            break
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func check()->Bool{
        
        for i in myArrayofRiceInventory
        {
            if i.emailid == emailfieldtocheck.text! && i.security == security.text!
            {
                return true
        
            }
            itr  = itr+1
            
        }
        return false
    }
    
//    func checkwhere()
//    {
//        var condition = false
//       
//        for j in 0..<myArrayofRiceInventory.count
//        {
//            if myArrayofRiceInventory[j].emailid! == emailfieldtocheck.text! && myArrayofRiceInventory[j].security == security.text!
//            {
//                condition = true
//                itr = j
//              break
//            }
//        }
//    }
 
    @IBAction func ongo(_ sender: Any) {
        
//        if check(){
//
//            performSegue(withIdentifier: "resetseague", sender: self)
//        }
        var email = String(emailfieldtocheck.text!)
        let resetpass = Email(email: email)
        AF.request("http://fundoonotes.incubation.bridgelabz.com/api/user/reset",
                   method: .post,
                   parameters: resetpass,
                   encoder: JSONParameterEncoder.default).responseJSON { response in
                   
                    if let data = response.data{
                        guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
                            else{
                                print("failed here")
                                return
                        }
                        
                        if let JSON = json as? [String:Any]{
                            //  labelHeader.text = JSON["title"] as? String
                            var message = JSON["message"] as? String
                            print(message)
                            var success = JSON["success"] as? Int
                            print(success)
                            if success == 1{
                                
                                self.alertsuccessfull(value: message!)
                            }
                            else
                            {
                                var error = JSON["error"] as? [String:Any]
                                var message = error!["message"] as? String
                                print(message)
                                self.alertme(value:message!)
                            }
                    }
                    
//                    debugPrint(response)
    }
}
}
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let vc = segue.destination as! FifthViewController
//        vc.getIndex = itr
//    }
    

}
