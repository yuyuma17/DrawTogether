//
//  ColorsCollectionViewCell.swift
//  DrawTogether
//
//  Created by 黃士軒 on 2020/2/15.
//  Copyright © 2020 Lacie. All rights reserved.
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorsView: UIView!
    
    func setView(_ colors: UIColor) {
        colorsView.backgroundColor = colors
        colorsView.setViewWithRoundCornerRadius(colorsView)
    }
}
