//
//  Line.swift
//  UITableViewSample01_UITableViewRowAction
//
//  Created by shigeki yamamoto on 2019/04/29.
//  Copyright © 2019 shigeki yamamoto. All rights reserved.
//

import UIKit

class Line: NSObject {
    var str: String
    var isCheck: Bool
    var isValid: Bool

    init(str: String, isCheck: Bool) {
        self.str = str
        self.isCheck = isCheck
        self.isValid = true
    }
}
