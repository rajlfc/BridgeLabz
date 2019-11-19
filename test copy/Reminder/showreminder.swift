//
//  showreminder.swift
//  FundooApp
//
//  Created by admin on 16/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

//func getNotes(_ callback: @escaping (_ medicineTypes:[Text]?)->Void)->Void
class showreminder: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var mycollectionview: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\\\\\\\\/15")
        print(reminderlist.count)
        return reminderlist.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("collectioncells")
        let item = reminderlist[indexPath.item]
        let cell = mycollectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! remindercollection
        cell.title.text = (item as Reminderclass).title
        print("//25")
        print(cell.title.text)
        cell.time.text = (item as Reminderclass).time
        cell.date.text = (item as Reminderclass).date
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("size matters")
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            print("asfasfasgasgagasg landscape")
            return CGSize(width: (UIScreen.main.bounds.height/3-8), height: (UIScreen.main.bounds.height/3-4))
        }
        else{
            print("jsdfjsdhjfhsd portrait")
            return CGSize(width: (UIScreen.main.bounds.width/3-6), height: (UIScreen.main.bounds.width/3-6))
        }
    }
    
    var titletext:String?
    var time : String?
    var date : String?
    var uuid: String?
    var reminderlist:[Reminderclass] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("62......viewdidload")
       // reminderlist = collectionArray2()
        collectionArray2({ (arrayofreminders) in
            
            self.reminderlist = arrayofreminders!
            self.mycollectionview.reloadData()
        })
        mycollectionview.reloadData()
        let itemsize = UIScreen.main.bounds.width/3-3
        //let itemsize1 = UIScreen.main.bounds.height/3-3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        mycollectionview.collectionViewLayout = layout
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
    func collectionArray2(_ callback: @escaping (_ medicineTypes:[Reminderclass]?)->Void)->Void{
        var reminders:[Reminderclass] = []
        var id = UserDefaults.standard.string(forKey: "idforlogin")
        //struct email doesn't contain email here, it contains voucher id of user
        //let utilityQueue = DispatchQueue.global(qos: .utility)
        let url = "http://fundoonotes.incubation.bridgelabz.com/api/notes/getReminderNotesList?access_token="+id!
        AF.request(url,method: .get).responseJSON/*(queue: utilityQueue)*/{ response in
            //debugPrint(response)
            let json = response.data
            guard let Json = try? JSONSerialization.jsonObject(with: json!, options: [])
                else{ print("failed here")
                    return}
            
            if let JSON = Json as? [String:Any]{
                if let success = JSON["data"] as? [String:Any]{
                    // print(success)
                    if let sccess = success["success"] as? Bool{
                        print(sccess)
                    }
                    var data = success["data"] as! [[String:Any]]
                    //print(data[0])
                    var numNotes = data.count
                    for i in 0 ..< numNotes{
                        var jsonLast = data[i]
                        if let JSON3 = jsonLast as? [String:Any]{
                            let title = JSON3["title"] as? String
                            let description = JSON3["description"] as? String
                            let color = JSON3["color"] as! String
                            let isArchived = JSON3["isArchived"] as! Bool
                            let id = JSON3["id"] as! String
                            let reminder = JSON3["reminder"] as! [String]
                            print("\(title) \(description) \(color) \(isArchived) id is  \(id) \(reminder[0])")
                            var str:String = reminder[0]
                            reminders.append(Reminderclass(time: self.timeString(str), date: str, title: title!, uuid: id))
                        }
                        
                    }
                    // print(reminders)
                }
                
            }
             callback(reminders)
        }
        // print(noteList)
        //   print(noteList)
        //sleep(1)
        // print(reminders)
        //return reminders
        
    }
    func dateString(_ str:String)->String{
        var items = str.components(separatedBy: " ")
        var dateStr = items[1]+" "+items[2]+" "+items[3]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        var dt = dateFormatter.date(from: dateStr)
        let formatter2 = DateFormatter()
        formatter2.dateStyle = DateFormatter.Style.short
        var date = formatter2.string(from: dt!)
        return date
    }
    func timeString(_ str:String)->String{
        var items = str.components(separatedBy: " ")
        var dateStr = items[4]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        var dt = dateFormatter.date(from: dateStr)
        let formatter2 = DateFormatter()
        formatter2.timeStyle = DateFormatter.Style.short
        var time = formatter2.string(from: dt!)
        return time
    }
}
