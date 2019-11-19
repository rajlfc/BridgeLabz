//
//  NoteOpenViewController.swift
//  FundooApp
//
//  Created by admin on 04/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
struct Modify:Encodable{
    let noteId:String?
    let title : String?
    let description:String?
    //let color : String?
}
struct changecolor:Encodable{
    let color:String?
    let noteIdList:[String]
}
class NoteOpenViewController: UIViewController {

    @IBOutlet weak var unarchive: UIButton!
    @IBOutlet weak var titleview: UITextView!
    var collection = false
    var index : Int?
    var bottomconstant = 0
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    var checkarray :[Text] = []
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
    var noteID:String = "A"
    var color : UIColor?
    @IBOutlet weak var noteview: UITextView!
    @IBOutlet weak var viewtop: UIView!
    var storenoteid = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        unarchive.isHidden = true
        //self.view.sendSubviewToBack(fullview)
        //print(button1.isSelected)
        
//        print(c)
//        print(d)
//        print("You are here fucker \(checkarray.count)")
        titleview.text = c
        noteview.text = d
        view.backgroundColor = UIColor.red
        //view.backgroundColor = loadCellColor(c)
        view.backgroundColor = color
        topview.constant = 0
        bottomview.constant = -UIScreen.main.bounds.height
        //viewtop.isHidden = true
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular
        {
            topview.constant = 0
            bottomview.constant = -180
        }
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact
        {
            topview.constant = 0
            bottomview.constant = -180
        }
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular
        {
            topview.constant = UIScreen.main.bounds.height
            bottomview.constant = 0
        }
        
        button1.layer.cornerRadius = 15
        button1.clipsToBounds = true
        button2.layer.cornerRadius = 15
        button3.layer.cornerRadius = 15
        if collection
        {
            unarchive.isHidden = false
        }
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
//    private func showSizeClasses(){
//        //        slidingViewLead = -UIScreen.main.bounds.width
//        //        slidingViewTrail = -UIScreen.main.bounds.width
//
//        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular{
//
//            if ham{
//                print("hi")
//                //takeNoteButton.isHidden = true
//                //            leadingc.constant = -414+150
//                //            trailingc.constant = -414+150
//                //viewnew.isHidden = false
//                //viewslide.isHidden = false
//                topview.constant = UIScreen.main.bounds.height-200
//                bottomview.constant = -UIScreen.main.bounds.width+150
//                //viewWillAppear(true)
//                //            leading.constant = -414+150
//                //            trailing.constant = -414+150
//                ham = true
//                print("ham \(ham)")
//            }
//            //            }else{
//            //                //takeNoteButton.isHidden = false
//            //                //buttonslideout.isHidden = false
//            //                //            leadingc.constant = -414
//            //                //            trailingc.constant = -414
//            //                //            leading.constant = -414
//            //                //            trailing.constant = -414
//            //                lead.constant = -UIScreen.main.bounds.width
//            //                trail.constant = -UIScreen.main.bounds.width
//            //                //viewslide.isHidden = true
//            //                //viewDidAppear(true)
//            //                ham = false
//            //                print("hielse")
//            //                print("ham \(ham)")
//            //            }
//
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            }) { (animationcomplete) in
//                print("hithere")
//            }
//
//        }
//        else
//        {
//            if ham{
//                print("hi")
//                //takeNoteButton.isHidden = true
//                //            leadingc.constant = -414+150
//                //            trailingc.constant = -414+150
//                //viewnew.isHidden = false
//                //viewslide.isHidden = false
//                lead.constant = -UIScreen.main.bounds.width+250
//                trail.constant = -UIScreen.main.bounds.width+250
//                //self.viewslide.frame.height = 100
//                //viewWillAppear(true)
//                //            leading.constant = -414+150
//                //            trailing.constant = -414+150
//                ham = true
//                print("ham \(ham)")
//            }
//            //            else{
//            //                //takeNoteButton.isHidden = false
//            //                //buttonslideout.isHidden = false
//            //                //            leadingc.constant = -414
//            //                //            trailingc.constant = -414
//            //                //            leading.constant = -414
//            //                //            trailing.constant = -414
//            //                lead.constant = -UIScreen.main.bounds.width
//            //                trail.constant = -UIScreen.main.bounds.width
//            //                //viewslide.isHidden = true
//            //                //viewDidAppear(true)
//            //                ham = false
//            //                print("hielse")
//            //                print("ham \(ham)")
//            //            }
//            //
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            }) { (animationcomplete) in
//                print("hithere")
//            }
//        }
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        showSizeClasses()
//    }
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        coordinator.animate(alongsideTransition: { coordinator in
//            self.showSizeClasses()
//        }, completion: nil)
//        print("hi vishnu")
//    }
    @IBAction func backtoprevious(_ sender: Any) {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
//        fetchRequest.predicate = NSPredicate(format: "title = %@", c)
//        do {
//            let test  = try context.fetch(fetchRequest)
//
//            let objectUpdate = test[0] as! NSManagedObject
//            objectUpdate.setValue(titleview.text, forKey: "title")
//            objectUpdate.setValue(noteview.text, forKey: "note")
//            //            objectUpdate.setValue("1234", forKey: "age")
//            //            objectUpdate.setValue("vffgf", forKey: "password")
//            do {
//                try context.save()
//            } catch  {
//                print(error)
//            }
//        } catch  {
//            print(error)
//        }
//        UserDefaults.standard.set(self.view.backgroundColor, forKey: titleview.text)
//        UserDefaults.standard.set(self.view.backgroundColor, forKey: noteview.text)
        var id = UserDefaults.standard.string(forKey: "idforlogin")
        var noteId = UserDefaults.standard.string(forKey: "idfornote")
        var title = titleview.text
        var description = noteview.text
        //var color = view.backgroundColor?.toHexString()
        let modify = Modify(noteId: noteID, title: title, description:description)
        print(modify)
        AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/updateNotes?access_token="+id!,
                   method: .post,
                   parameters: modify,
                   encoder: JSONParameterEncoder.default).response { response in
                    debugPrint(response)
        }
        var color = view.backgroundColor?.toHexString()
        var chngeclr = changecolor(color: color, noteIdList: [noteID])
        AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/changesColorNotes?access_token=" + id!,
                   method : .post,
                   parameters: chngeclr,
                   encoder: JSONParameterEncoder.default
            ).responseJSON { (response) in
                debugPrint(response)
        }
        
        if collection == false
        {
            let main = UIStoryboard(name: "Main", bundle: nil)
            let vc = main.instantiateViewController(withIdentifier: "SecondVC")
            self.present(vc, animated: true, completion: nil)
        }
        else
        {
            let main = UIStoryboard(name: "Main", bundle: nil)
            let vc = main.instantiateViewController(withIdentifier: "ArchiveVC") as! ArchiveController
            let main1 = UIStoryboard(name: "Main", bundle: nil)
            let vc1 = main.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
            vc.showlist = vc1.archivelist
            print("i am \(vc1.archivelist)")
            //print(vc1.returnarray().count)
            //print(vc1.collectinArray().count)
            print("I am here asdsfsfa \(checkarray.count)")
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func deletenote(_ sender: Any) {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "title = %@", UserDefaults.standard.string(forKey: "titlefornote")!)
        do {
            let test  = try context.fetch(fetchRequest)

            let objectDelete = test[0] as! NSManagedObject
            context.delete(objectDelete)
            do {
                try context.save()
                alertDelete()
                if Connectivity.isConnectedToInternet == false
                {
                    storenoteid.append(noteID)
                }

            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
        if Connectivity.isConnectedToInternet == false
        {
            UserDefaults.standard.set(storenoteid, forKey: "noteeide")
            UserDefaults.standard.set(true, forKey: "deletecheck")
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

        
       
        var id = UserDefaults.standard.string(forKey: "idforlogin")
        var noteid = UserDefaults.standard.string(forKey: "idfornote")
        var NoteID = ["noteIdList" : [noteID]]
        AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/deleteForeverNotes?access_token=" + id!,
                   method : .post,
                   parameters: NoteID,
                   encoder: JSONParameterEncoder.default
            ).responseJSON { (response) in
                debugPrint(response)
        }
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(vc, animated: true, completion: nil)
        titleview.text = nil
        noteview.text = nil
    }
    
    @IBAction func bottomtotop(_ sender: Any) {
        //print(traitCollection.horizontalSizeClass.description)
        
        print("button")
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular
        {
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
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact
        {
            if !ham{
                self.ham = true
                //viewtop.isHidden = false
                self.topview.constant = -200
                self.bottomview.constant = 60
                
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
        else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular
        {
            if !ham{
                self.ham = true
                //viewtop.isHidden = false
                self.topview.constant = -200
                self.bottomview.constant = 60
                
            }
            else
            {
                //viewtop.isHidden = true
                self.ham = false
                //topview.constant = -128
                //            bottomview.constant = -128
                self.topview.constant = 0
                self.bottomview.constant = -UIScreen.main.bounds.height
            }
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationcomplete) in
                print("hi")
            }
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
    
    @IBAction func markasimportant(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "title = %@", c)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            //objectUpdate.setValue(titleview.text, forKey: "title")
            //objectUpdate.setValue(noteview.text, forKey: "note")
            objectUpdate.setValue(true, forKey: "important")
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
    
}

    @IBAction func unarchivenote(_ sender: Any) {
        
        print("unarchive")
        updatecoredata(c: c)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        checkarray = first.collectinArray()
        checkarray = checkarray.filter({$0.archive != true})
        //print("hello you \(showlist.count)")
        for i in 0..<checkarray.count
        {
            checkarray[i].index = i
            if checkarray[i].texttitle == c
            {
                index = i
            }
        }
        updateuserdefault(index: index!)
        
    }
    func updatecoredata(c:String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "title = %@", c)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            //            objectUpdate.setValue(titleview.text, forKey: "title")
            //            objectUpdate.setValue(noteview.text, forKey: "note")
            objectUpdate.setValue(false, forKey: "archive")
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
        
    }
    func updateuserdefault(index : Int)
    {
        var indexArr = retrieveOrderNotes()
        print("i am inside\(indexArr)")
        var updatedIndexArr = indexArr
        if indexArr?.count != 0 {
            for i in 0 ..< updatedIndexArr!.count{
                if updatedIndexArr![i] >= index{
                    updatedIndexArr![i] = updatedIndexArr![i]+1
                }
            }
            updatedIndexArr?.insert(index, at: 0)
              print("i am inside\(indexArr)")
            UserDefaults.standard.removeObject(forKey: "Index")
            let defaults = UserDefaults.standard
            defaults.set(updatedIndexArr, forKey: "Index")
        }
        
    }
    @IBAction func setreminder(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "reminderVC") as! ReminderSet
        first.str = titleview.text
        first.noteID = noteID
        self.present(first, animated: true, completion: nil)
    }
}
