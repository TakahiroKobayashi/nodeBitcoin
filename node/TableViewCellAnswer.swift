//
//  TableViewCellAnswer.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/17.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit

class TableViewCellAnswer: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var textview: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textview.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
