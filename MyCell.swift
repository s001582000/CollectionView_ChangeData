//
//  MyCell.swift
//  CollectionViewDemo2
//
//  Created by 梁雅軒 on 2017/2/13.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    @IBOutlet weak var lblMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfo(info:DataDetailInfo) {
        lblMessage.text = info.message
        self.backgroundColor = info.isSelect ? UIColor.red : UIColor.white
    }

}
