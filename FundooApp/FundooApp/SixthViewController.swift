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

    @IBOutlet weak var viewslide: UIView!
    @IBOutlet weak var titlefield: UITextView!
    @IBOutlet weak var notefield: UITextView!
    var ham = false
   // NSLayoutConstraint!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var viewsli: UIView!
    //@IBOutlet weak var view: UIView!
    @IBOutlet weak var topview: NSLayoutConstraint!
    
    @IBOutlet weak var bottomview: NSLayoutConstraint!
    //@IBOutlet weak var topview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topview.constant = 576+128+80
        bottomview.constant = 0
        
        //viewslide.isHidden = false
        button1.layer.cornerRadius = 15
        //button1.clipsToBounds = true
        button2.layer.cornerRadius = 15
        button3.layer.cornerRadius = 15
//        if titlefield.text != nil
//        {
//             view.backgroundColor = loadCellColor(titlefield.text)
//        }
        
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
        let defaults = UserDefaults.standard
        var array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
        var count = array.count
        array.append(count)
        UserDefaults.standard.removeObject(forKey: "Index")
        defaults.set(array, forKey: "Index")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
         UserDefaults.standard.set(self.view.backgroundColor, forKey: titlefield.text)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pressslide(_ sender: Any) {
        
        if !ham{
            self.ham = true
            //viewtop.isHidden = false
            self.topview.constant = 576
            self.bottomview.constant = 70

        }
        else
        {
            //viewtop.isHidden = true
            self.ham = false
            //topview.constant = -128
            //            bottomview.constant = -128
            self.topview.constant = 576+128+80
            self.bottomview.constant = 0
        }



        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("hi")
        }
    }
    
    @IBAction func button1(_ sender: Any) {
        
        view.backgroundColor = UIColor(red: 150/255, green: 255/255, blue: 174/255, alpha: 1)
        
    }
    @IBAction func button2(_ sender: Any) {
        
         view.backgroundColor = UIColor(red: 255/255, green: 55/255, blue: 50/255, alpha: 1)
    }
    
    @IBAction func button3(_ sender: Any) {
        
        view.backgroundColor = UIColor(red: 57/255, green: 92/255, blue: 255/255, alpha: 1)
    }
    func loadCellColor(_ title: String)-> UIColor{
        let defaults = UserDefaults.standard
        var color = defaults.color(forKey: title)
        return color!
    }
}

