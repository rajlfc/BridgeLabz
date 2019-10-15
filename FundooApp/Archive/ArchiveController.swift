//
//  ArchiveController.swift
//  FundooApp
//
//  Created by admin on 12/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ArchiveController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var showlist: [Text] = []
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hfdrtdrtdtffygv")
        print(showlist.count)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        showlist = first.collectinArray()
        showlist = showlist.filter({$0.archive != false})
        print("hello you \(showlist.count)")
        for i in showlist{
            print(i.archive)
            print(i.texttitle)
            print(i.textnote)
        }
        let itemsize = UIScreen.main.bounds.width/3-3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionview.collectionViewLayout = layout
        // Do any additional setup after loading the view.
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return showlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var item = showlist[indexPath.item]
         let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! archivecell
        
        cell2.textarchivelabel.text = item.texttitle
        cell2.textarchiveview.text = item.textnote
        cell2.backgroundColor = loadCellColor((item as! Text).texttitle)
        cell2.layer.borderWidth = 5
        cell2.layer.borderColor = UIColor.black.cgColor

        return cell2
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("hi")
        //count = 0
       
        
            
            let main = UIStoryboard(name: "Main", bundle: nil)
            let first = main.instantiateViewController(withIdentifier: "NoteOpen") as! NoteOpenViewController
            first.c = (showlist[indexPath.item] as! Text).texttitle
            first.d = (showlist[indexPath.item] as! Text).textnote
            first.collection = true
            self.present(first, animated: true, completion: nil)
        
    }

    @IBAction func backtosecond(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier: "SecondVC")
        self.present(first, animated: true, completion: nil)
        
    }
    func loadCellColor(_ title: String)-> UIColor{
        let defaults = UserDefaults.standard
        var color = defaults.color(forKey: title)
        return color!
    }
    
}
