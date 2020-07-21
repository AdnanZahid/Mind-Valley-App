//
//  FontKit.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class FontKit {
    
    enum Style: String {
        case normal = ""
        case italic = "Italic"
    }
    
    enum Family: String {
        case roboto = "Roboto"
    }
    
    enum Weight: String {
        case regular = "Regular"
        case bold = "Bold"
    }
    
    enum Size: CGFloat {
        case heading = 30
        case subHeading = 20
        case title = 17
        case subtitle = 13
    }
    
    static func font(style: Style,
                     family: Family,
                     weight: Weight,
                     size: Size) -> UIFont {
        return UIFont(name: "\(family.rawValue)-\(weight.rawValue)\(style.rawValue)",
            size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
    }
}
