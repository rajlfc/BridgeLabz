//
//  SecondViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate, UITextFieldDelegate{
    
    
    @IBOutlet weak var profileimage: UIImageView!
    
    var nameprofile = ""
    var finallist = [Text]()
    
    @IBOutlet weak var backfromsearch: UIButton!
    var trait:UITraitCollection?
    @IBOutlet weak var slidingbutton: UIButton!
    var sizeclass : Bool?
    var arrayofcount = [Int]()
    var changesizeclass = false
    var searching = false
    @IBOutlet weak var textsearch: UITextField!
    
    //    @IBOutlet weak var leading: NSLayoutConstraint!
//    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var viewslide: UIView!
    var array:[Int] = []
    @IBOutlet weak var labelDeleteIt: UILabel!
    @IBOutlet weak var noofselects: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    var count = 0
    var countofwords:Int?
    @IBOutlet weak var tableview: UITableView!
    var collection = false
    @IBOutlet weak var buttonslideout: UIButton!
    var titlesearch:[Text] = Array()
    var originaltitlesearch : [Text] = Array()
    var onlinearray :[Text] = []
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
//        var id = UserDefaults.standard.string(forKey: "idforlogin")
//        print("idforlogin")
        layout()
        var getnotes = fetchnotes()
        //print("/////////108")
        //print(getnotes.returnlist)
        
        //onlinearray.append(getnotes.getNotes())
        //print(id)
        print("114...................////////")
        
        if let imageData = UserDefaults.standard.object(forKey: "KeyImage"),
            let image = UIImage(data: (imageData as! NSData) as Data){
            
            profileimage.image = image
        }
         let userLoginStatus = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
         print("facebook login \(userLoginStatus)")
        array.append(1)
        lead.constant = -UIScreen.main.bounds.width
        trail.constant = -UIScreen.main.bounds.width
        let collectionviewlayout = collectionview.collectionViewLayout as! UICollectionViewLayout
        collectionviewlayout
        print("sizeclasssssssssssssssssssssss \(sizeclass)")
        textsearch.delegate = self
        
        print("==========")
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "FirstVC") as! ViewController
        //print(first.check())
        print(originaltitlesearch.count)
        textsearch.addTarget(self, action: #selector(searchRecords(_ :)), for: .editingChanged)
       // tableview.isHidden = true
        //backfromsearch.isHidden = true
        //buttonslideout.isHidden = true
       // viewnew.isHidden = false
//        leadingc.constant = 0
//        trailingc.constant = 0
//          leading.constant = -414
//          trailing.constant = -414

        
        
            print("afsfasgagagasg  else")
            lead.constant = -UIScreen.main.bounds.width
            //trail.constant = -UIScreen.main.bounds.width
               //     changesizeclass = sizeclass!
        
        
      UserDefaults.standard.removeObject(forKey: "Index")
        //viewslide.isHidden = true
        viewup.isHidden = true
//        getnotes.getNotes { (arrayofMedicines) in
//            print("hereeeeeeeeeeeeeeeeeee..............................116")
//            var d = (arrayofMedicines?.count)
////            print(arrayofMedicines![0].texttitle)
////            print(arrayofMedicines![0].textnote)
////            print(arrayofMedicines![0].archive)
////            var text3 = Text(texttitle: arrayofMedicines![0].texttitle, textnote: arrayofMedicines![0].textnote, index: arrayofMedicines![0].index, important: arrayofMedicines![0].important, archive: arrayofMedicines![0].archive, id: arrayofMedicines![0].id, color: arrayofMedicines![0].color)
////            tempArray.append(text3)
////            print("417...................../////")
////            print(tempArray.count)
//            self.noteList = arrayofMedicines!
//            print("/////////////168 \(self.noteList.count)")
//            return self.noteList
//        }
                        print("hereeeeeeeeeeeeeeeeeee..............................116")
//                        var d = (arrayofMedicines?.count)
//                        print(arrayofMedicines![0].texttitle)
//                        print(arrayofMedicines![0].textnote)
//                        print(arrayofMedicines![0].archive)
            //print(arrayofMedicines![1].color)
//                        var text3 = Text(texttitle: arrayofMedicines![0].texttitle, textnote: arrayofMedicines![0].textnote, index: arrayofMedicines![0].index, important: arrayofMedicines![0].important, archive: arrayofMedicines![0].archive, id: arrayofMedicines![0].id, color: arrayofMedicines![0].color)
//                        tempArray.append(text3)
//                        print("417...................../////")
//                        print(tempArray.count)
                     //   self.noteList = arrayofMedicines!
                        //print("/////////////168 \(self.noteList.count)")
            //print("///////////170 \(self.noteList.count)")
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
                self.noteList2 = Array(repeating: Text(texttitle: "", textnote: "", index: 0, important: false, archive: false, id: "abc", color: UIColor.gray), count: self.noteList.count)
                for i in 0 ..< noteList.count{
                    noteList2[i] = noteList[ordrArry![i]] as! Text
                }
            }else{
                noteList2 = noteList as! [Text]
                print("........193.....\(self.noteList2.count)")
                loadIndex = Array(repeating: 0, count: self.noteList2.count)
                
                for i in 0 ..< noteList2.count{
                    loadIndex[i] = i
                }
                print("printing----\(self.loadIndex)")
                // UserDefaults.standard.removeObject(forKey: "Index")
                let defaults = UserDefaults.standard
                defaults.set(self.loadIndex, forKey: "Index")
                print("retrieved \(retrieveOrderNotes())")
                
            }
            for i in 0..<noteList2.count
            {
                titlesearch.append(self.noteList2[i])
                print(titlesearch[i].texttitle)
            }
            for str in titlesearch{
                originaltitlesearch.append(str)
            }
            print("--------------")
           
            //self.layout()
            
            //noteList = collectinArray()
            print("//////////204 \(self.noteList.count)")
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
            
            longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(gesture:)))
            collectionview.addGestureRecognizer(longPressGesture)
            collectionview.reloadData()
            
                        //return self.noteList
        
       /* print("///////////170 \(noteList.count)")
        //noteList = collectinArray()
       
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
            noteList2 = Array(repeating: Text(texttitle: "", textnote: "", index: 0, important: false, archive: false, id: "abc", color: UIColor.gray), count: noteList.count)
            for i in 0 ..< noteList.count{
                noteList2[i] = noteList[ordrArry![i]] as! Text
            }
        }else{
            noteList2 = noteList as! [Text]
            print("........193.....\(noteList2.count)")
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
        for i in 0..<noteList2.count
        {
            titlesearch.append(noteList2[i])
            print(titlesearch[i].texttitle)
        }
        for str in titlesearch{
            originaltitlesearch.append(str)
        }
        print("--------------")
        let itemsize = UIScreen.main.bounds.width/3-3
        let itemsize1 = UIScreen.main.bounds.height/3-3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionview.collectionViewLayout = layout
        

        //noteList = collectinArray()
        print("//////////204 \(noteList.count)")
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
          collectionview.allowsMultipleSelection = true*/
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
                lead.constant = -UIScreen.main.bounds.width+150
                trail.constant = -UIScreen.main.bounds.width+150
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
        else
        {
            print("jhasdkhfcjkshdkfhklsdfhsalkhfklsdhafkljhsdjfhsjkdhfjksdhfkjsdhfkjsdhfkjhsdkhfksdhf")
            if ham{
                print("hisdgvdsgsgsgsdgsdgsdgdsgsdgsdgsgsgs")
                //takeNoteButton.isHidden = true
                //            leadingc.constant = -414+150
                //            trailingc.constant = -414+150
                //viewnew.isHidden = false
                //viewslide.isHidden = false
                lead.constant = -UIScreen.main.bounds.width+250
                trail.constant = -UIScreen.main.bounds.width+250
                //self.viewslide.frame.height = 100
                //viewWillAppear(true)
                //            leading.constant = -414+150
                //            trailing.constant = -414+150
                //ham = true
                print("ham \(ham)")
            }
            else
            {
                lead.constant = -UIScreen.main.bounds.width
                trail.constant = -UIScreen.main.bounds.width
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
        
    }
    func layout()
    {
        let itemsize = UIScreen.main.bounds.width/3-3
        let itemsize1 = UIScreen.main.bounds.height/3-3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionview.collectionViewLayout = layout
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textsearch.resignFirstResponder()
        return true
    }
    //MARK:- searchRecords
    @objc func searchRecords(_ textField: UITextField) {
        self.titlesearch.removeAll()
        print("386................\(titlesearch.count)")
        print("Here i am ")
        if textField.text?.count != 0 {
            searching = true
            print("here")
            print("390.........................\(originaltitlesearch.count)")
            for i in 0..<originaltitlesearch.count {
                print("Here Genk")
                if let countryToSearch = textField.text{
                    
                    print("ifhere......393")
                    print("394.............\(originaltitlesearch[i].texttitle)")
                    let range = originaltitlesearch[i].texttitle.lowercased().range(of: countryToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        self.titlesearch.append(originaltitlesearch[i])
                        print("483.............\(originaltitlesearch[i].important)")
                        if !originaltitlesearch[i].important{
                            //buttonc.isHidden = true
                        }
                    }
                }
            }
        } else {
            //buttonc.isHidden = false
            searching = false
            for country in originaltitlesearch {
                titlesearch.append(country)
            }
        }
        noteList2 = titlesearch
        //searching = true
        collectionview.reloadData()
    }
    override var canBecomeFirstResponder: Bool {
        return true
    }
    func collectinArray()->[Text]{
        
        var tempArray:[Text] = []
        //var getnotes = fetchnotes()
        //print("////////////376")
        //print(getnotes.getNotes().count)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for i in 0 ..< result.count{
                let data: NSManagedObject = result[i] as! NSManagedObject
              var  n = data.value(forKey: "title") as? String
             var   m = data.value(forKey: "note") as? String
             var   b = (data.value(forKey: "important") as? Bool)
             var   arch = (data.value(forKey: "archive") as? Bool)
                var color = UIColor.color(withData: (data.value(forKey: "color") as? Data)!)
                var id = data.value(forKey: "id") as? String
                //print("boolean is \(b)")
                if n != nil {
                   // print("//////392 ahgfdhjasfgfdksdhfjksddsffsf")
                    //var text3 = Text(text: n!)
                    if b == nil
                    {
                        b = false
                    }
                    //print("b is \(b)")
                    var text3 = Text(texttitle: n!, textnote: m!, index: i, important: b!, archive: arch!, id: id!, color: color)
                    //tempArray.append(text3)
                    //tempArray.append(onlinearray)
                   // tempArray = getnotes.getNotes()
                    //print("////////////403")
                    var getnotes = fetchnotes()
//                    getnotes.getNotes { (arrayofMedicines) in
//                        print("hereeeeeeeeeeeeeeeeeee..............................427")
//                        var d = (arrayofMedicines?.count)
//                        print(arrayofMedicines![0].texttitle)
//                        print(arrayofMedicines![0].textnote)
//                        print(arrayofMedicines![0].archive)
//                        var text3 = Text(texttitle: arrayofMedicines![0].texttitle, textnote: arrayofMedicines![0].textnote, index: arrayofMedicines![0].index, important: arrayofMedicines![0].important, archive: arrayofMedicines![0].archive, id: arrayofMedicines![0].id, color: arrayofMedicines![0].color)
                        tempArray.append(text3)
//                        print("417...................../////")
//                        print(tempArray.count)
//                        return tempArray
//                    }

                    //print(tempArray[i].texttitle)
                }
            }
            
        } catch {
            
            print("Failed")
        }
        
//        print("...................432")
//        print(tempArray.count)
//        print("hi i am being formed")
          return tempArray
    }
    // let array:[String] = ["2","3","4","5"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("i am here \(noteList.count)")
        //noteList2 = noteList
        //returnarray(value: noteList2)
        print("searching \(noteList2)")
        if searching {
            print(titlesearch.count)
            return titlesearch.count
        }
        else
        {
            print(noteList2.count)
           return noteList2.count
        }
        
    }
    func returnarray(value:[Text])->[Text]{
        
        return value
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        countofwords = 0
        var item = noteList2[indexPath.item]
        //var item1 = titlesearch[indexPath.item]
        print("asdfgsdgsdgsdgsdgsdgsdgadsada")
        print(titlesearch.count)
        for i in 0..<titlesearch.count
        {
            print(".............")
            print(titlesearch[i].texttitle)
        }
        //var item1 = titlesearch[indexPath.item]
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
        print("searching \(searching)")
//        if searching == false
//        {
            cell2.isUserInteractionEnabled = true
            cell2.textlabel.text = (item as! Text).texttitle
            cell2.textview.text = (item as! Text).textnote
             for i in 0..<cell2.textview.text.count
             {
                countofwords = countofwords! + 1
             }
        print("Look here")
        print(countofwords)
        arrayofcount.append(countofwords!)
            //  if conditionTest{
//            cell2.backgroundColor = loadCellColor((item as! Text).texttitle)
        if searching == true && !item.important
        {
            cell2.buttonc.isHidden = true
        }
        if searching == false && !item.important
        {
            cell2.buttonc.isHidden = true
        }
        cell2.backgroundColor = noteList2[indexPath.row].color
            //  }else{
            // cell2.backgroundColor = UIColor.lightGray
            // }
            print("Image button is \((item as! Text).important)")
            if (item as! Text).important
            {
                cell2.buttonc.isHidden = false
                print("if image")
                let origImage = UIImage(named: "image4")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                cell2.buttonc.setImage(tintedImage, for: .normal)
                cell2.buttonc.tintColor = .yellow
            }
        //}
//        else
//        {
//            //cell2.isUserInteractionEnabled = true
//            print("hhhhhhhhhhhhhh")
//            print((item1 as! Text).texttitle)
//            cell2.textlabel.text = (item1 as! Text).texttitle
//            cell2.textview.text = (item1 as! Text).textnote
//            //  if conditionTest{
//            cell2.backgroundColor = loadCellColor((item1 as! Text).texttitle)
//            //  }else{
//            // cell2.backgroundColor = UIColor.lightGray
//            // }
//            print("Image button is \((item1 as! Text).important)")
//            if (item1 as! Text).important
//            {
//                print("if image")
//                let origImage = UIImage(named: "image4")
//                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
//                cell2.buttonc.setImage(tintedImage, for: .normal)
//                cell2.buttonc.tintColor = .yellow
//            }
//        }
//        
        //cell2.contentView.backgroundColor = UserDefaults.standard.object(forKey: "color") as! UIColor
//        let decodedColorsData  = UserDefaults.standard.object(forKey: "ColorsKey")
//        cell2.contentView.backgroundColor = decodedColorsData as! UIColor
//        print("........")
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let first = main.instantiateViewController(withIdentifier: "NoteOpen") as! NoteOpenViewController
//        print("first..\(first.c)")
        //print(cell2.textlabel.text)
        //cell2.contentView.backgroundColor = UserDefaults.standard.color(forKey: cell2.textlabel.text!)
//        cell2.textlabel.backgroundColor = UserDefaults.standard.color(forKey: cell2.textlabel.text!)
//        cell2.textview.backgroundColor = UserDefaults.standard.color(forKey: cell2.textlabel.text!)
        //    condition = false
       // }
        //collectionview.reloadData()
       // collectionview.layoutIfNeeded()
         //cell2.textlabel.sizeToFit()
         return cell2
        //return condition ? cell:cell2
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return "String".size(withAttributes: nil)
//    }
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
            first.color = noteList2[indexPath.row].color
            first.noteID = noteList2[indexPath.row].id
            first.checkarray = archivelist
            self.present(first, animated: true, completion: nil)
        case .select:
            dictionarySelectedIndecPath[indexPath] = true
        }
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//
//
//
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("1111111111111")
        print(arrayofcount.count)
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            print("asfasfasgasgagasg landscape")
            return CGSize(width: (UIScreen.main.bounds.height/3-8), height: (UIScreen.main.bounds.height/3-4))
        }
        else{
            print("jsdfjsdhjfhsd portrait")
          
//            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! textlabelcollect
//            let contentsize = cell2.textview.sizeThatFits(cell2.textview!.bounds.size)
           return CGSize(width: (UIScreen.main.bounds.width/3-6), height: (UIScreen.main.bounds.width/3-6))
//             return CGSize(width: (UIScreen.main.bounds.width/3-6), height: CGFloat(arrayofcount[indexPath.row])+2.0)
            //return CGSize(width: UIScreen.main.bounds.width/3-6, height: ((noteList2[indexPath.item].textnote as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize:18.0)])) as! CGFloat)
//            return cell2.textview.text.size(withAttributes: nil)
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
        //if check(str: <#T##Bool#>)
        //{
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular{
            
            if !ham{
                print("hi")
                //takeNoteButton.isHidden = true
                //            leadingc.constant = -414+150
                //            trailingc.constant = -414+150
                //viewnew.isHidden = false
                //viewslide.isHidden = false
                lead.constant = -UIScreen.main.bounds.width+150
                trail.constant = -UIScreen.main.bounds.width+150
                //viewWillAppear(true)
                //            leading.constant = -414+150
                //            trailing.constant = -414+150
                ham = true
                print("ham \(ham)")
            }else{
                //takeNoteButton.isHidden = false
                //buttonslideout.isHidden = false
                //            leadingc.constant = -414
                //            trailingc.constant = -414
                //            leading.constant = -414
                //            trailing.constant = -414
                lead.constant = -UIScreen.main.bounds.width
                trail.constant = -UIScreen.main.bounds.width
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
        else
        {
            if !ham{
                print("hi")
                //takeNoteButton.isHidden = true
                //            leadingc.constant = -414+150
                //            trailingc.constant = -414+150
                //viewnew.isHidden = false
                //viewslide.isHidden = false
                lead.constant = -UIScreen.main.bounds.width+250
                trail.constant = -UIScreen.main.bounds.width+250
                //viewWillAppear(true)
                //            leading.constant = -414+150
                //            trailing.constant = -414+150
                ham = true
                print("ham \(ham)")
            }else{
                //takeNoteButton.isHidden = false
                //buttonslideout.isHidden = false
                //            leadingc.constant = -414
                //            trailingc.constant = -414
                //            leading.constant = -414
                //            trailing.constant = -414
                lead.constant = -UIScreen.main.bounds.width
                trail.constant = -UIScreen.main.bounds.width
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
        
        //}
//        else
//        {
//            if !ham{
//                print("hi")
//                //takeNoteButton.isHidden = true
//                //            leadingc.constant = -414+150
//                //            trailingc.constant = -414+150
//                //viewnew.isHidden = false
//                //viewslide.isHidden = false
//                lead.constant = -414+150
//                trail.constant = -414+150
//                //viewWillAppear(true)
//                //            leading.constant = -414+150
//                //            trailing.constant = -414+150
//                ham = true
//                print("ham \(ham)")
//            }else{
//                //takeNoteButton.isHidden = false
//                //buttonslideout.isHidden = false
//                //            leadingc.constant = -414
//                //            trailingc.constant = -414
//                //            leading.constant = -414
//                //            trailing.constant = -414
//                lead.constant = -414
//                trail.constant = -414
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
//        }
//
        
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
    
    // long press
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    //print("asdjhasd")
    
    @IBAction func reminder(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "showreminder") as! showreminder
        //first.showlist = archivelist
        self.present(first,animated: true,completion: nil)
    }
    
    func check(str:Bool)->Bool
    {
        print("asjfkasjfckas\(str)")
        return str
    }
}

