//
//  ViewController.swift
//  AddressBook
//
//  Created by admin on 06/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet weak var hellolabel: NSTextField!
    
    @IBOutlet weak var textfield: NSTextField!
    
    @IBAction func saybuttonclicked(_ sender: Any) {
        
        var name = textfield.stringValue
        if name.isEmpty {
            name = "World"
        }
        let greeting = "Hello \(name)!"
        hellolabel.stringValue = greeting
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

