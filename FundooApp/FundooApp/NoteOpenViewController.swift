//
//  NoteOpenViewController.swift
//  FundooApp
//
//  Created by admin on 04/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class NoteOpenViewController: UIViewController {

    @IBOutlet weak var titleview: UITextView!
    
    //@IBOutlet weak var topview: NSLayoutConstraint!
    
    @IBOutlet weak var color : UIColor!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var bottomview: NSLayoutConstraint!
    @IBOutlet weak var topview: NSLayoutConstraint!
    //@IBOutlet weak var topview: NSLayoutConstraint!
    var c = ""
    
   // @IBOutlet weak var bottomview: NSLayoutConstraint!
    var d = ""
    var n : String?
    var m : String?
    var ham = false
    var a:String?
    var b:String?
    @IBOutlet weak var noteview: UITextView!
    @IBOutlet weak var viewtop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(c)
        print(d)
        titleview.text = c
        noteview.text = d
        //viewtop.isHidden = true
        topview.constant = 30
        bottomview.constant = -180
        button1.layer.cornerRadius = 0.2 * button1.bounds.size.width
        button1.clipsToBounds = true
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
    @IBAction func backtoprevious(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "title = %@", c)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(titleview.text, forKey: "title")
            objectUpdate.setValue(noteview.text, forKey: "note")
            //            objectUpdate.setValue("1234", forKey: "age")
            //            objectUpdate.setValue("vffgf", forKey: "password")
            do {
                try context.save()
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func deletenote(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "title = %@", c)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectDelete = test[0] as! NSManagedObject
            context.delete(objectDelete)
            do {
                try context.save()
                alertDelete()
                
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func bottomtotop(_ sender: Any) {
        
        if !ham{
            self.ham = true
            //viewtop.isHidden = false
            self.topview.constant = -231
            self.bottomview.constant = 81
            
        }
        else
        {
            //viewtop.isHidden = true
            self.ham = false
           //topview.constant = -128
//            bottomview.constant = -128
            self.topview.constant = 30
            self.bottomview.constant = -180
        }
        
        
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("hi")
        }
    }
    @IBAction func button1(_ sender: Any) {
        
        button1.isSelected = true
        self.view.backgroundColor = UIColor(red: 150/255, green: 255/255, blue: 174/255, alpha: 0.5)
        //UserDefaults.standard.set(self.view.backgroundColor, forKey: "color1")
        //let t = UserDefaults.standard.object(forKey: "color1") as! UIColor
        //print(t)
    }
}

