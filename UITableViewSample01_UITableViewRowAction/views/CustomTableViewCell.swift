//
//  CustomTableViewCell.swift
//  UITableViewSample01_UITableViewRowAction
//
//  Created by shigeki yamamoto on 2019/04/29.
//  Copyright © 2019 shigeki yamamoto. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var imageCheck: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
