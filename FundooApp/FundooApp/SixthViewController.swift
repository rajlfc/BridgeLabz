//
//  SixthViewController.swift
//  FundooApp
//
//  Created by admin on 25/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class SixthViewController: UIViewController {

    @IBOutlet weak var titlefield: UITextView!
    @IBOutlet weak var notefield: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func backtoprev(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(first, animated: true, completion: nil)
    }
    
    @IBAction func onsave(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(titlefield.text, forKey: "title")
        newUser.setValue(notefield.text, forKey: "note")
        //newUser.setValue("1", forKey: "age")
        
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
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
