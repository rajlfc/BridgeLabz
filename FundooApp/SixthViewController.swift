//
//  SixthViewController.swift
//  FundooApp
//
//  Created by admin on 25/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var titlefield: UITextField!
    @IBOutlet weak var notefield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func backtoprev(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC")
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

}
