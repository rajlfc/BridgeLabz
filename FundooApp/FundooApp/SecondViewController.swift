//
//  SecondViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate {
    
    
//    @IBOutlet weak var leading: NSLayoutConstraint!
//    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var viewslide: UIView!
    var array:[Int] = []
    @IBOutlet weak var labelDeleteIt: UILabel!
    @IBOutlet weak var noofselects: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    var count = 0
    var collection = false
    @IBOutlet weak var buttonslideout: UIButton!
    enum Mode{
        
        case view
        case select
    }
    var mMode: Mode = .view {
        didSet {
            switch mMode {
                 case .view:
                    for (key, value) in dictionarySelectedIndecPath {
                        if value {
                            collectionview.deselectItem(at: key, animated: true)
                        }
                    }
                    
                    dictionarySelectedIndecPath.removeAll()

                    collectionview.allowsMultipleSelection = false
            case .select:
                    collectionview.allowsMultipleSelection = true
                
            }
        }
    }
    @IBOutlet weak var viewup: UIView!
    var conditionTest:Bool = true
    var changeborder = false
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    @IBOutlet weak var takeNoteButton: UIButton!
    //@IBOutlet weak var buttoncell: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var result: UILabel!
    //@IBOutlet weak var buttoncell: UIButton!
    @IBOutlet weak var viewnew: UIView!
    @IBOutlet weak var trailingc: NSLayoutConstraint!
    @IBOutlet weak var leadingc: NSLayoutConstraint!
    
    @IBOutlet weak var buttonhide: UIButton!
    @IBOutlet weak var buttonc: UIButton!
    @IBOutlet weak var buttoncel: UIButton!
    var result1:[NSManagedObject] = []
    var noteList:[Text] = []
    var ordrArry:[Int] = []
    var loadIndex:[Int] = []
    var noteList2:[Text] = []
    var archivelist:[Text] = []
    var b : Bool?
    var arch : Bool?
    var n : String?
    var m : String?
   
    @IBOutlet weak var lead: NSLayoutConstraint!
    @IBOutlet weak var trail: NSLayoutConstraint!
    @IBOutlet weak var imagelabel: UILabel!
    //let first = ViewController()
     var dictionarySelectedIndecPath: [IndexPath: Bool] = [:]
    
    var ham : Bool = false
    @IBOutlet weak var textlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        array.append(1)
        //buttonslideout.isHidden = true
       // viewnew.isHidden = false
//        leadingc.constant = 0
//        trailingc.constant = 0
//          leading.constant = -414
//          trailing.constant = -414
        lead.constant = -414
        trail.constant = -414
      //  UserDefaults.standard.removeObject(forKey: "Index")
        //viewslide.isHidden = true
        viewup.isHidden = true
        noteList = collectinArray()
         noteList = noteList.filter({$0.archive != true})
        //archivelist = noteList.filter({$0.archive != false})
        for i in 0..<noteList.count
        {
            noteList[i].index = i
        }
        //print("hftytyftyffgygytftyfty \(archivelist[0].texttitle) \(archivelist[0].archive) \(archivelist[0].textnote)")
       
        var ordrArry = retrieveOrderNotes()
        print("did load \(ordrArry)")
        if ordrArry?.count != 0 {
            print("retrieved after load = \(ordrArry)")
            noteList2 = Array(repeating: Text(texttitle: "", textnote: "", index: 0, important: false, archive: false), count: noteList.count)
            for i in 0 ..< noteList.count{
                noteList2[i] = noteList[ordrArry![i]] as! Text
            }
        }else{
            noteList2 = noteList as! [Text]
            loadIndex = Array(repeating: 0, count: noteList2.count)
            
            for i in 0 ..< noteList2.count{
                loadIndex[i] = i
            }
            print("printing----\(loadIndex)")
            // UserDefaults.standard.removeObject(forKey: "Index")
            let defaults = UserDefaults.standard
            defaults.set(loadIndex, forKey: "Index")
            print("retrieved \(retrieveOrderNotes())")
            
        }
        let itemsize = UIScreen.main.bounds.width/3-3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionview.collectionViewLayout = layout
        

        noteList = collectinArray()
        //shade.backgroundColor = UIColor(white: 1, alpha: 0.5)
        // Do any additional setup after loading the view.
        //textlabel.text = first.pract()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
//        do {
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject] {
//                n = data.value(forKey: "title") as? String
//                print(n)
//            }
//            
//        } catch {
//            
//            print("Failed")
//        }
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionview.addGestureRecognizer(longPressGesture)
       // let longpress = UILongPressGestureRecognizer(target: self, action: #selector(handlelongpress(sender:)))
        //collectionview.addGestureRecognizer(longpress)
//        let lpgr : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(gestureRecognizer:)))
//        lpgr.minimumPressDuration = 0.5
//        lpgr.delegate = self as! UIGestureRecognizerDelegate
//        lpgr.delaysTouchesBegan = true
//        self.collectionview?.addGestureRecognizer(lpgr)
          collectionview.allowsMultipleSelection = true
    }
    override var canBecomeFirstResponder: Bool {
        return true
    }
    func collectinArray()->[Text]{
        
        var tempArray:[Text] = []

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for i in 0 ..< result.count{
                let data: NSManagedObject = result[i] as! NSManagedObject
                n = data.value(forKey: "title") as? String
                m = data.value(forKey: "note") as? String
                b = (data.value(forKey: "important") as? Bool)
                arch = (data.value(forKey: "archive") as? Bool)
                //print("boolean is \(b)")
                if n != nil {
                    //var text3 = Text(text: n!)
                    if b == nil
                    {
                        b = false
                    }
                    //print("b is \(b)")
                    var text3 = Text(texttitle: n!, textnote: m!, index: i, important: b!, archive: arch!)
                    tempArray.append(text3)
                }
            }
            
        } catch {
            
            print("Failed")
        }
        
        print(tempArray.count)
        print("hi i am being formed")
        return tempArray
    }
    // let array:[String] = ["2","3","4","5"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("i am here \(noteList.count)")
        return noteList2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item = noteList2[indexPath.item]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagecell", for: indexPath) as! myCell
        //        if selectedRow == indexPath.row {
        //            cell.layer.borderColor = UIColor.blue.cgColor
        //            cell.layer.borderWidth = 1
        //        }
        //        else {
        //            cell.layer.borderWidth = 0
        //        }
        
        
        
//        cell.layer.borderWidth = 5
//        cell.layer.borderColor = UIColor.black.cgColor
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! textlabelcollect
//        let editButton = UIButton(frame: CGRect(x:0, y:20, width:40,height:40))
//        editButton.setImage(UIImage(named: "84380.png"), for: UIControl.State.normal)
//        editButton.addTarget(self, action: #selector(getter: editButtonItem), for: UIControl.Event.touchUpInside)
//        
//        cell2.addSubview(editButton)
          if changeborder
          {
            cell2.layer.borderWidth = 3
            cell2.layer.borderColor = UIColor.black.cgColor
        }
//        cell2.layer.borderWidth = 5
//        cell2.layer.borderColor = UIColor.black.cgColor
        var condition = true
     // if item is Image{
//            //cell.Image.image = (item as! Image).image
//             cell.imageview.image = (item as! Image).image
//            // cell.setImage(image: item as! Image)
       // }
       // else if item is Text{
            //cell2.textLabel?.text = (item as! Text).text
            cell2.isUserInteractionEnabled = true
            cell2.textlabel.text = (item as! Text).texttitle
            cell2.textview.text = (item as! Text).textnote
      //  if conditionTest{
            cell2.backgroundColor = loadCellColor((item as! Text).texttitle)
  //  }else{
           // cell2.backgroundColor = UIColor.lightGray
       // }
        print("Image button is \((item as! Text).important)")
        if (item as! Text).important
        {
            print("if image")
            let origImage = UIImage(named: "image4")
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            cell2.buttonc.setImage(tintedImage, for: .normal)
            cell2.buttonc.tintColor = .yellow
        }
        //cell2.contentView.backgroundColor = UserDefaults.standard.object(forKey: "color") as! UIColor
//        let decodedColorsData  = UserDefaults.standard.object(forKey: "ColorsKey")
//        cell2.contentView.backgroundColor = decodedColorsData as! UIColor
        print("........")
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "NoteOpen") as! NoteOpenViewController
        print("first..\(first.c)")
        //print(cell2.textlabel.text)
        //cell2.contentView.backgroundColor = UserDefaults.standard.color(forKey: cell2.textlabel.text!)
//        cell2.textlabel.backgroundColor = UserDefaults.standard.color(forKey: cell2.textlabel.text!)
//        cell2.textview.backgroundColor = UserDefaults.standard.color(forKey: cell2.textlabel.text!)
        //    condition = false
       // }
         return cell2
        //return condition ? cell:cell2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("hi")
        //count = 0
        count = count + 1
        noofselects.text = String(count)
        switch mMode {
        case .view:
            collectionView.deselectItem(at: indexPath, animated: true)
            let main = UIStoryboard(name: "Main", bundle: nil)
            let first = main.instantiateViewController(withIdentifier: "NoteOpen") as! NoteOpenViewController
            first.c = (noteList2[indexPath.item] as! Text).texttitle
            first.d = (noteList2[indexPath.item] as! Text).textnote
            first.checkarray = archivelist
            self.present(first, animated: true, completion: nil)
        case .select:
            dictionarySelectedIndecPath[indexPath] = true
        
    }

    
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if mMode == .select
        {
            dictionarySelectedIndecPath[indexPath] = false
        }
        
    }
    
    
    
    
    @IBAction func onbutton(_ sender: Any) {
        //print("clicked")
        if !ham{
            print("hi")
            takeNoteButton.isHidden = true
//            leadingc.constant = -414+150
//            trailingc.constant = -414+150
            //viewnew.isHidden = false
            //viewslide.isHidden = false
            lead.constant = -414+150
            trail.constant = -414+150
            //viewWillAppear(true)
//            leading.constant = -414+150
//            trailing.constant = -414+150
            ham = true
            print("ham \(ham)")
        }else{
            takeNoteButton.isHidden = false
            //buttonslideout.isHidden = false
//            leadingc.constant = -414
//            trailingc.constant = -414
//            leading.constant = -414
//            trailing.constant = -414
            lead.constant = -414
            trail.constant = -414
            //viewslide.isHidden = true
            //viewDidAppear(true)
            ham = false
            print("hielse")
             print("ham \(ham)")
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("hithere")
        }
        
    }
//    override func viewWillAppear(_ animated: Bool){
//
//            viewslide.transform = CGAffineTransform(translationX: 0, y: -viewslide.frame.height)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//
//            UIView.animate(withDuration: 0.25) {
//                self.viewslide.transform = .identity
//        }
//    }
//    @IBAction func onbuttonpressed(_ sender: Any) {
//        
//        
//    }
    
    
    @IBAction func signingout(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "FirstVC")
        self.present(first, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func tapnote(_ sender: Any) {
        performSegue(withIdentifier: "connectnote", sender: self)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = noteList2.remove(at: sourceIndexPath.item)
        noteList2.insert(temp,at: destinationIndexPath.item)
        
        loadIndex = Array(repeating: 0, count: noteList2.count)
      
        for i in 0 ..< noteList2.count{
            loadIndex[i] = noteList2[i].index
        }
          print("printing----\(loadIndex)")
       // UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        defaults.set(loadIndex, forKey: "Index")
        print("retrieved \(retrieveOrderNotes())")
        
        
    }
    
    func retrieveOrderNotes()->[Int]?{
        let defaults = UserDefaults.standard
        let array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
        print("see here")
        print(array)
        return array
    }
    
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer){
        switch gesture.state {
        case .began:
            changeborder = true
            viewup.isHidden = false
            count = 0
            mMode = mMode == .view ? .select : .view
            guard let selectedIndexPath = collectionview.indexPathForItem(at: gesture.location(in: collectionview)) else{ break }
            collectionview.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionview.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
           // changeborder = false
            //viewup.isHidden = true
            collectionview.endInteractiveMovement()
        default:
            viewup.isHidden = true
            collectionview.cancelInteractiveMovement()
        }
    }
    
    func loadCellColor(_ title: String)-> UIColor{
        let defaults = UserDefaults.standard
        var color = defaults.color(forKey: title)
        return color!
    }
    
    @objc func handleMenuItemAction() {
        print("menu item tapped")
    }
    @objc func handleMenuItemAction1() {
        print("menu item tapped rotate")
    }
    
    @IBAction func cancelselection(_ sender: Any) {
        
        viewup.isHidden = true
        mMode = mMode == .view ? .select : .view
        count = 0
    }
    
    @IBAction func archivenotes(_ sender: Any) {
        
        var deleteNeededIndexPaths: [IndexPath] = []
        for (key, value) in dictionarySelectedIndecPath {
            if value {
                deleteNeededIndexPaths.append(key)
            }
        }
        
        for i in deleteNeededIndexPaths.sorted(by: { $0.item > $1.item }) {
            updatecoredata(c: noteList2[i.item].texttitle)
            noteList2.remove(at: i.item)
            updateuserdefault(index: i.item)
        }
        for i in 0..<noteList2.count
        {
            noteList2[i].index = i
        }
        collectionview.deleteItems(at: deleteNeededIndexPaths)
        dictionarySelectedIndecPath.removeAll()
        
    }
    func updateuserdefault(index : Int)
    {
        var indexArr = retrieveOrderNotes()
        if indexArr?.count != 0 {
            var updatedIndexArr = indexArr!.filter {$0 != index}
            for i in 0 ..< updatedIndexArr.count{
                if updatedIndexArr[i] > index{
                    updatedIndexArr[i] = updatedIndexArr[i]-1
                }
            }
            UserDefaults.standard.removeObject(forKey: "Index")
            let defaults = UserDefaults.standard
            defaults.set(updatedIndexArr, forKey: "Index")
        }
        
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
            objectUpdate.setValue(true, forKey: "archive")
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
    
    
    
    
    
    @IBAction func slideout(_ sender: Any) {
        
        lead.constant = -414
        trail.constant = -414
        ham = false
        takeNoteButton.isHidden = false
    }
    func returnarray()->[Int]
    {
        return array
    }
    
    @IBAction func buttontoarchive(_ sender: Any) {
        
        print("Archive")
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "ArchiveVC") as! ArchiveController
        //first.showlist = archivelist
        self.present(first,animated: true,completion: nil)
    }
    //print("asdjhasd")
}
