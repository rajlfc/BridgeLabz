//
//  textstruct.swift
//  FundooApp
//
//  Created by admin on 01/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class textlabelcollect: UICollectionViewCell {
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var buttonc: UIButton!
    
    @IBOutlet weak var selectedview: UIImageView!
    @IBOutlet weak var highlightedview: UIView!
    
    override var isHighlighted: Bool {
        didSet {
            highlightedview.isHidden = !isHighlighted
        }
    }
    
    override var isSelected: Bool {
        didSet {
            highlightedview.isHidden = !isSelected
            selectedview.isHidden = !isSelected
        }
    }
    
}
