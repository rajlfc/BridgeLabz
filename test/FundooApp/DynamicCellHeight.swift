//
//  DynamicCellHeight.swift
//  FundooApp
//
//  Created by admin on 23/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DynamicCellHeight: UICollectionView {

   
        override func layoutSubviews() {
            super.layoutSubviews()
            if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
                self.invalidateIntrinsicContentSize()
            }
        }
        
        override var intrinsicContentSize: CGSize {
            return contentSize
        }
    

}
