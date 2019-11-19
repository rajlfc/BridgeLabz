//
//  showreminder.swift
//  FundooApp
//
//  Created by admin on 16/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class showreminder: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var mycollectionview: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminderlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = reminderlist[indexPath.item]
        let cell = mycollectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! remindercollection
        cell.title.text = (item as Reminderclass).title
        cell.time.text = (item as Reminderclass).time
        cell.date.text = (item as Reminderclass).date
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        
        

        return cell
    }
    
    
    var titletext:String?
    var time : String?
    var date : String?
    var uuid: String?
    var reminderlist:[Reminderclass] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        reminderlist = collectinArray()
//        let itemsize = UIScreen.main.bounds.width-3
//        //let itemsize1 = UIScreen.main.bounds.height/3-3
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
//        layout.itemSize = CGSize(width: itemsize, height: itemsize)
//        layout.minimumInteritemSpacing = 3
//        layout.minimumLineSpacing = 3
//        mycollectionview.collectionViewLayout = layout
    }
    func collectinArray()->[Reminderclass]{
        
        var tempArray:[Reminderclass] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Reminder")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for i in 0 ..< result.count{
                let data: NSManagedObject = result[i] as! NSManagedObject
                titletext = data.value(forKey: "title") as? String
                print(titletext)
                time = data.value(forKey: "time") as? String
                print(time)
                date = (data.value(forKey: "date") as? String)
                print(date)
                uuid = (data.value(forKey: "uuid") as? String)
                //print("boolean is \(b)")
                if titletext != nil {
                    //var text3 = Text(text: n!)
                    
                    //print("b is \(b)")
                    var text3 = Reminderclass(time: time!, date: date!, title: titletext!, uuid: uuid!)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        //first.showlist = archivelist
        self.present(first,animated: true,completion: nil)
    }
}
