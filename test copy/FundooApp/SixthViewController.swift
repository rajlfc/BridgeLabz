//
//  SixthViewController.swift
//  FundooApp
//
//  Created by admin on 25/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
struct CreateNote:Encodable{
    let title:String?
    let description:String?
    let color : String?
}
class SixthViewController: UIViewController {
    @IBOutlet weak var savenote: UIButton!
    
    @IBOutlet weak var buttonleading: NSLayoutConstraint!
    @IBOutlet weak var viewslide: UIView!
    @IBOutlet weak var titlefield: UITextView!
    @IBOutlet weak var notefield: UITextView!
    //var collection = false
    var ham = false
   // NSLayoutConstraint!
    @IBOutlet weak var viewsliding: UIView!
    var mark = false
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var markasimportant: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var viewsli: UIView!
    //@IBOutlet weak var view: UIView!
    @IBOutlet weak var topview: NSLayoutConstraint!
    
    @IBOutlet weak var bottomview: NSLayoutConstraint!
    //@IBOutlet weak var topview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        savenote.translatesAutoresizingMaskIntoConstraints = false
        savenote.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       // viewsliding.isHidden = true
        //print(markasimportant.isEnabled)
//        if markasimportant.isSelected || markasimportant.isEnabled
//        {
//            print("Good")
//        }
        // Do any additional setup after loading the view.
        print("entering")
        topview.constant = UIScreen.main.bounds.height
        bottomview.constant = 10
//        print(traitCollection.horizontalSizeClass.description)
//        if traitCollection.horizontalSizeClass == .regular
//        {
//            print("well..")
//        }
//        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular
//        {
//            print("compact regular")
//            topview.constant = 576+128+80
//            //topview.constant = 0
//            bottomview.constant = 0
//        }
//        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact
//        {
//            print("regular compact")
//            topview.constant = -200
//            //topview.constant = 0
//            bottomview.constant = 0
//        }
//        else if traitCollection.horizontalSizeClass.description == "??" && traitCollection.verticalSizeClass.description == "??"
//        {
//            print("regular regular")
//            topview.constant = 0
//            bottomview.constant = 0
//        }
        
//        topview.constant = UIScreen.main.bounds.height+80
//        bottomview.constant = 0

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
    private func showSizeClasses(){
        //        slidingViewLead = -UIScreen.main.bounds.width
        //        slidingViewTrail = -UIScreen.main.bounds.width
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular{
            
            if ham{
                print("hi")
                //takeNoteButton.isHidden = true
                //            leadingc.constant = -414+150
                //            trailingc.constant = -414+150
                //viewnew.isHidden = false
                //viewslide.isHidden = false
                topview.constant = 576
                bottomview.constant = 70
                //viewWillAppear(true)
                //            leading.constant = -414+150
                //            trailing.constant = -414+150
                //ham = true
                print("ham \(ham)")
            }
            //            }else{
            //                //takeNoteButton.isHidden = false
            //                //buttonslideout.isHidden = false
            //                //            leadingc.constant = -414
            //                //            trailingc.constant = -414
            //                //            leading.constant = -414
            //                //            trailing.constant = -414
            //                lead.constant = -UIScreen.main.bounds.width
            //                trail.constant = -UIScreen.main.bounds.width
            //                //viewslide.isHidden = true
            //                //viewDidAppear(true)
            //                ham = false
            //                print("hielse")
            //                print("ham \(ham)")
            //            }
            
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            }) { (animationcomplete) in
//                print("hithere")
//            }
            
        }
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact
        {
            if ham{
                print("hi")
                //takeNoteButton.isHidden = true
                //            leadingc.constant = -414+150
                //            trailingc.constant = -414+150
                //viewnew.isHidden = false
                //viewslide.isHidden = false
                topview.constant = 215
                bottomview.constant = 30
                //self.viewslide.frame.height = 100
                //viewWillAppear(true)
                //            leading.constant = -414+150
                //            trailing.constant = -414+150
                //ham = true
                print("ham \(ham)")
            }
            //            else{
            //                //takeNoteButton.isHidden = false
            //                //buttonslideout.isHidden = false
            //                //            leadingc.constant = -414
            //                //            trailingc.constant = -414
            //                //            leading.constant = -414
            //                //            trailing.constant = -414
            //                lead.constant = -UIScreen.main.bounds.width
            //                trail.constant = -UIScreen.main.bounds.width
            //                //viewslide.isHidden = true
            //                //viewDidAppear(true)
            //                ham = false
            //                print("hielse")
            //                print("ham \(ham)")
            //            }
            //
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            }) { (animationcomplete) in
//                print("hithere")
//            }
        }
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
            
            let orientation = UIApplication.shared.statusBarOrientation
            if orientation == .landscapeLeft || orientation == .landscapeRight
            {
                if ham{
                    //self.ham = true
                    print(ham)
                    
                    //viewtop.isHidden = false
                    self.topview.constant = 700
                    self.bottomview.constant = 100
                    self.buttonleading.constant = 1050
                    
                }
                else
                {
                    //viewtop.isHidden = true
                    //self.ham = false
                    print(ham)
                    //topview.constant = -128
                    //            bottomview.constant = -128
                    self.topview.constant = UIScreen.main.bounds.height
                    self.bottomview.constant = 0
                }
            }
            else
            {
                if ham{
                    //self.ham = true
                    print(ham)
                    
                    //viewtop.isHidden = false
                    self.topview.constant = 900
                    self.bottomview.constant = 100
                    
                    
                }
                else
                {
                    //viewtop.isHidden = true
                    //self.ham = false
                    print(ham)
                    //topview.constant = -128
                    //            bottomview.constant = -128
                    self.topview.constant = UIScreen.main.bounds.height
                    self.bottomview.constant = 0
                }
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showSizeClasses()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { coordinator in
            self.showSizeClasses()
        }, completion: nil)
        print("hi vishnu")
    }
    @IBAction func backtoprev(_ sender: Any) {
        
        
        
            let main = UIStoryboard(name: "Main", bundle: nil)
            let first = main.instantiateViewController(withIdentifier: "SecondVC")
            self.present(first, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func onsave(_ sender: Any) {
        
        
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//
//        newUser.setValue(titlefield.text, forKey: "title")
//        newUser.setValue(notefield.text, forKey: "note")
//        newUser.setValue(false, forKey: "archive")
//        print("mark is \(mark)")
//        if mark
//        {
//            newUser.setValue(true, forKey: "important")
//        }
//        //newUser.setValue("1", forKey: "age")
//        let defaults = UserDefaults.standard
//        var array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
//        var count = array.count
//        array.append(count)
//        UserDefaults.standard.removeObject(forKey: "Index")
//        defaults.set(array, forKey: "Index")
//
//        do {
//            try context.save()
//        } catch {
//            print("Failed saving")
//        }
//
//         UserDefaults.standard.set(self.view.backgroundColor, forKey: titlefield.text)
        var id = UserDefaults.standard.string(forKey: "idforlogin")
        var title = titlefield.text
        var description = notefield.text
        var color = view.backgroundColor?.toHexString()
        let create = CreateNote(title: title, description: description, color: color)
        print(create)
        AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/addNotes?access_token="+id!,
                   method: .post,
                   parameters: create,
                   encoder: JSONParameterEncoder.default).response { response in
                    debugPrint(response)
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
    @IBAction func pressslide(_ sender: Any) {
        
        print("sixthview")
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation == .landscapeLeft || orientation == .landscapeRight
        {
            print("Good good")
        }
        print(traitCollection.horizontalSizeClass.description)
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular
        {
            if !ham{
                self.ham = true
                
                //viewtop.isHidden = false
                self.topview.constant = 576
                self.bottomview.constant = 70
                viewsliding.isHidden = false
                
            }
            else
            {
                //viewtop.isHidden = true
                self.ham = false
                //topview.constant = -128
                //            bottomview.constant = -128
                self.topview.constant = UIScreen.main.bounds.height
                self.bottomview.constant = 0
            }
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationcomplete) in
                print("hi")
            }
        }
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact
        {
            //viewsliding.isHidden = false
            print(ham)
            if !ham{
                self.ham = true
                print(ham)
                
                //viewtop.isHidden = false
                self.topview.constant = 215
                self.bottomview.constant = 30
                
                
            }
            else
            {
                //viewtop.isHidden = true
                self.ham = false
                print(ham)
                //topview.constant = -128
                //            bottomview.constant = -128
                self.topview.constant = 215+200
                self.bottomview.constant = 0
            }
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationcomplete) in
                print("hi")
            }
        }
            
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular && !(orientation == .landscapeRight || orientation == .landscapeLeft)
        {
            //viewsliding.isHidden = false
            print(ham)
            if !ham{
                self.ham = true
                print(ham)
                
                //viewtop.isHidden = false
                self.topview.constant = 900
                self.bottomview.constant = 100
                
                
            }
            else
            {
                //viewtop.isHidden = true
                self.ham = false
                print(ham)
                //topview.constant = -128
                //            bottomview.constant = -128
                self.topview.constant = UIScreen.main.bounds.height
                self.bottomview.constant = 0
            }
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationcomplete) in
                print("hi")
            }
        }
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular && (orientation == .landscapeRight || orientation == .landscapeLeft)
        {
            //viewsliding.isHidden = false
            print(ham)
            if !ham{
                self.ham = true
                print(ham)
                
                //viewtop.isHidden = false
                self.topview.constant = 600
                self.bottomview.constant = 100
                
                
            }
            else
            {
                //viewtop.isHidden = true
                self.ham = false
                print(ham)
                //topview.constant = -128
                //            bottomview.constant = -128
                self.topview.constant = UIScreen.main.bounds.height
                self.bottomview.constant = 0
            }
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationcomplete) in
                print("hi")
            }
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
    
    @IBAction func markimport(_ sender: Any) {
        
        if mark == false
        {
            mark = true
        }
    }
}
extension UIUserInterfaceSizeClass:CustomStringConvertible{
    public var description: String{
        switch self {
        case .compact: return "Compact"
        case .regular: return "Regular"
        case .unspecified: return "??"
            
        }
    }
}

