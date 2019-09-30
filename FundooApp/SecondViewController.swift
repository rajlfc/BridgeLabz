//
//  SecondViewController.swift
//  FundooApp
//
//  Created by admin on 20/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var takeNoteButton: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var viewnew: UIView!
    @IBOutlet weak var trailingc: NSLayoutConstraint!
    @IBOutlet weak var shade: UIView!
    @IBOutlet weak var shadeButton: UIButton!
    
    @IBOutlet weak var leadingc: NSLayoutConstraint!
    //let first = ViewController()
    var ham : Bool = false
    @IBOutlet weak var textlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        leadingc.constant = -414
        trailingc.constant = -414
        shade.isHidden = true
          shadeButton.isHidden = true
        //shade.backgroundColor = UIColor(white: 1, alpha: 0.5)
        // Do any additional setup after loading the view.
        //textlabel.text = first.pract()
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
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
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
