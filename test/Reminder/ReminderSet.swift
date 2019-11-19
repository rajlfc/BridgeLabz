//
//  ReminderSet.swift
//  FundooApp
//
//  Created by admin on 15/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData
import Alamofire

struct ReminderNotes:Encodable{
    
    let reminder:String?
    let noteIdList:[String]?
}
class ReminderSet: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    private var datepicker:UIDatePicker?
    var str = ""
    var uuid : String?
    var noteID:String?
    var check:Bool?
    var storedate = [String]()
    var storenoteid = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(str)
//        if Connectivity.isConnectedToInternet{
//            save()
//        }
        // Do any additional setup after loading the view.
        datepicker = UIDatePicker()
        datepicker?.datePickerMode = .dateAndTime
        datepicker?.addTarget(self, action: #selector(ReminderSet.getDateTime), for: .valueChanged)
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(ReminderSet.viewtapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapgesture)
        textfield.inputView = datepicker
    }
    @objc func viewtapped(gestureRecognizer:UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    @objc func getDateTime() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datepicker!.date)
        textfield.text = strDate
        return dateFormatter.date(from: strDate)!
    }
    func showNotification() {
        
    }
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let dateTime = getDateTime()
        let strDate = dateFormatter.string(from: dateTime)
        return strDate
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let dateTime = getDateTime()
        let strDate = dateFormatter.string(from: dateTime)
        return strDate
    }
    
    func save()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Reminder", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)

        newUser.setValue(getDate(), forKey: "date")
        newUser.setValue(getTime(), forKey: "time")
        newUser.setValue(str, forKey: "title")
        newUser.setValue(uuid, forKey: "uuid")
        

        do {
            try context.save()
            if Connectivity.isConnectedToInternet == false
            {
                storedate.append(getDate())
                storenoteid.append(noteID!)
               
            }
        } catch {
            print("Failed saving")
        }
        
        if Connectivity.isConnectedToInternet == false
        {
            UserDefaults.standard.set(storedate, forKey: "date")
            UserDefaults.standard.set(storenoteid,forKey: "NoteeId")
            UserDefaults.standard.set(true, forKey: "checknet")
        }
        
        var id = UserDefaults.standard.string(forKey: "idforlogin")
        var remindernote = ReminderNotes(reminder: getDate(), noteIdList: [noteID!])
        AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/addUpdateReminderNotes?access_token="+id!,
                   method: .post,
                   parameters: remindernote,
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

    @IBAction func set(_ sender: Any) {
        
        print("Atcivr")
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            //handle error
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Fundoo"
        content.body = "You have one reminder"
        let dateTime = getDateTime()
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid!, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: {(error) in
            // handle error
        })
        save()
        
    }
    @IBAction func backtoMain(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        //first.showlist = archivelist
        self.present(first,animated: true,completion: nil)
    }
}
