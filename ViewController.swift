//
//  ViewController.swift
//  CollectionViewPratcice
//
//  Created by admin on 30/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var images:[Any] = []
    var result:[NSManagedObject] = []
    @IBOutlet weak var mycollectionview: UICollectionView!
    var selectedRow = -1
    var n:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = SecondViewController()
        images = collectinArray()
        // Do any additional setup after loading the view.
        let itemsize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        mycollectionview.collectionViewLayout = layout
        
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
        var image1 = Image(image: UIImage(named: "2")!)
         var image2 = Image(image: UIImage(named: "3")!)
         var image3 = Image(image: UIImage(named: "4")!)
         var image4 = Image(image: UIImage(named: "5")!)
        var text1 = Text(text: "sudipta")
        var text2 = Text(text: "just text")
       
        tempArray.append(image1)
        tempArray.append(image2)
        tempArray.append(image3)
        tempArray.append(image4)
        tempArray.append(text1)
        tempArray.append(text2)
//        if text3.text != "Title" && text3.text != "Raj" && text3.text != "Yuiop"
//        {
//            tempArray.append(text3)
//        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                n = data.value(forKey: "title") as? String
                if n != nil{
                    var text3 = Text(text: n!)
                    tempArray.append(text3)
                }
            }
            
        } catch {
            
            print("Failed")
        }
    
//        for data in result as! [NSManagedObject] {
//            n = data.value(forKey: "title") as? String
//            if n != nil{
//            var text3 = Text(text: n!)
//            tempArray.append(text3)
//            }
////            print(n)
//        }
//        if n != nil
//        {
//            print("if")
//             var text3 = Text(text: n!)
//            tempArray.append(text3)
//        }
       // tempArray.append(n)
        print(tempArray.count)
        return tempArray
    }
   // let array:[String] = ["2","3","4","5"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item = images[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
//        if selectedRow == indexPath.row {
//            cell.layer.borderColor = UIColor.blue.cgColor
//            cell.layer.borderWidth = 1
//        }
//        else {
//            cell.layer.borderWidth = 0
//        }
        
        cell.layer.borderWidth = 5
        cell.layer.borderColor = UIColor.black.cgColor
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "textFieldCell", for: indexPath) as! TextCollectionViewCell
        cell2.layer.borderWidth = 5
        cell2.layer.borderColor = UIColor.black.cgColor
        var condition = true
        if item is Image{
            cell.Image.image = (item as! Image).image
       // cell.setImage(image: item as! Image)
        }
    else if item is Text{
            cell2.textLabel?.text = (item as! Text).text
            //cell2.setText(item: item as! Text)
            condition = false
        }
       // return cell
        return condition ? cell:cell2
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if selectedRow == indexPath.row {
//            selectedRow = -1
//        } else {
//            selectedRow = indexPath.row
//        }
//        collectionView.reloadData()
//    }
//

    

    @IBAction func pressbutt(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(first, animated: true, completion: nil)
    }
    
}

