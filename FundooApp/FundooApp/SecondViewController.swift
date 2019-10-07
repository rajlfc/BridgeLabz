//
//  SecondViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var takeNoteButton: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var viewnew: UIView!
    @IBOutlet weak var trailingc: NSLayoutConstraint!
    @IBOutlet weak var shade: UIView!
    @IBOutlet weak var shadeButton: UIButton!
    var result1:[NSManagedObject] = []
    var images:[Any] = []
    var n : String?
    var m : String?
    @IBOutlet weak var leadingc: NSLayoutConstraint!
    //let first = ViewController()
    @IBOutlet weak var collectionview: UICollectionView!
    var ham : Bool = false
    @IBOutlet weak var textlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemsize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionview.collectionViewLayout = layout
        leadingc.constant = -414
        trailingc.constant = -414
        shade.isHidden = true
          shadeButton.isHidden = true
        images = collectinArray()
        //shade.backgroundColor = UIColor(white: 1, alpha: 0.5)
        // Do any additional setup after loading the view.
        //textlabel.text = first.pract()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                n = data.value(forKey: "title") as? String
                print(n)
            }
            
        } catch {
            
            print("Failed")
        }
        
        
        
    }
    func collectinArray()->[Any]{
        
        var tempArray:[Any] = []

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                n = data.value(forKey: "title") as? String
                m = data.value(forKey: "note") as? String
                if n != nil{
                    //var text3 = Text(text: n!)
                    var text3 = Text(texttitle: n!, textnote: m!)
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
        print(images.count)
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item = images[indexPath.item]
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
        cell2.layer.borderWidth = 5
        cell2.layer.borderColor = UIColor.black.cgColor
        var condition = true
      if item is Image{
//            //cell.Image.image = (item as! Image).image
//             cell.imageview.image = (item as! Image).image
//            // cell.setImage(image: item as! Image)
        }
        else if item is Text{
            //cell2.textLabel?.text = (item as! Text).text
            cell2.textlabel.text = (item as! Text).texttitle
            cell2.textview.text = (item as! Text).textnote
        
        //cell2.contentView.backgroundColor = UserDefaults.standard.object(forKey: "color") as! UIColor
            condition = false
        }
         return cell2
        //return condition ? cell:cell2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hi")
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "NoteOpen") as! NoteOpenViewController
        first.c = (images[indexPath.item] as! Text).texttitle
        first.d = (images[indexPath.item] as! Text).textnote
        self.present(first, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func onbutton(_ sender: Any) {
        
        if !ham{
            takeNoteButton.isHidden = true
            shade.isHidden = false
            shadeButton.isHidden = false
            leadingc.constant = -414+150
            trailingc.constant = -414+150
            ham = true
        }else{
            shade.isHidden = true
            shadeButton.isHidden = true
            takeNoteButton.isHidden = false
            leadingc.constant = -414
            trailingc.constant = -414
            ham = false
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("hi")
        }
        
    }
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
    
    @IBAction func shadeAction(_ sender: Any) {
        leadingc.constant = -414
        trailingc.constant = -414
        shadeButton.isHidden = true
        shade.isHidden = true
        takeNoteButton.isHidden = false
    }
    
    
    
}
