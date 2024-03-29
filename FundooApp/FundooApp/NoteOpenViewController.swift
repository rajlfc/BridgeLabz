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
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    var noteIndex: Int = 0
    @IBOutlet weak var bottomview: NSLayoutConstraint!
    @IBOutlet weak var topview: NSLayoutConstraint!
    //@IBOutlet weak var topview: NSLayoutConstraint!
    var c = ""
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
        //self.view.sendSubviewToBack(fullview)
        //print(button1.isSelected)
        
        print(c)
        print(d)
        titleview.text = c
        noteview.text = d
        view.backgroundColor = UIColor.red
        view.backgroundColor = loadCellColor(c)
        
        //viewtop.isHidden = true
        topview.constant = 0
        bottomview.constant = -180
        button1.layer.cornerRadius = 15
        button1.clipsToBounds = true
        button2.layer.cornerRadius = 15
        button3.layer.cornerRadius = 15
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
        UserDefaults.standard.set(self.view.backgroundColor, forKey: titleview.text)
        UserDefaults.standard.set(self.view.backgroundColor, forKey: noteview.text)
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
        var indexArr = retrieveOrderNotes()
        if indexArr?.count != 0 {
            var updatedIndexArr = indexArr!.filter {$0 != noteIndex}
            for i in 0 ..< updatedIndexArr.count{
                if updatedIndexArr[i] > noteIndex{
                    updatedIndexArr[i] = updatedIndexArr[i]-1
                }
            }
            UserDefaults.standard.removeObject(forKey: "Index")
            let defaults = UserDefaults.standard
            defaults.set(updatedIndexArr, forKey: "Index")
        }
    
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(vc, animated: true, completion: nil)
        titleview.text = nil
        noteview.text = nil
        
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
            self.topview.constant = 0
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
//        self.view.backgroundColor = UIColor(red: 150/255, green: 255/255, blue: 174/255, alpha: 0.5)
//        //UserDefaults.standard.set(self.view.backgroundColor, forKey: "color1")
//        //let t = UserDefaults.standard.object(forKey: "color1") as! UIColor
//        //print(t)
//        UserDefaults.standard.set(self.view.backgroundColor, forKey: titleview.text)
//        UserDefaults.standard.set(true, forKey: noteview.text)
        
           view.backgroundColor = UIColor(red: 150/255, green: 255/255, blue: 174/255, alpha: 1)
       //  view.backgroundColor = UIColor.yellow
        
    }
    
    @IBAction func button2(_ sender: Any) {
        
         view.backgroundColor = UIColor(red: 255/255, green: 55/255, blue: 50/255, alpha: 1)
        
    }
    
    @IBAction func button3(_ sender: Any) {
        
         view.backgroundColor = UIColor(red: 57/255, green: 92/255, blue: 255/255, alpha: 1)
    }
    func retrieveOrderNotes()->[Int]?{
    //UserDefaults.standard.removeObject(forKey: "Index")
    let defaults = UserDefaults.standard
    let array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
    return array
  }
    
    func loadCellColor(_ title: String)-> UIColor{
        let defaults = UserDefaults.standard
        var color = defaults.color(forKey: title)
        return color!
    }
    
    
}

