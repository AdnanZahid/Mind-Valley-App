//
//  SelfResizingTableView.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 22/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SelfResizingTableView: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
