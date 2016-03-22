//
//  Constants.swift
//  DevStat
//
//  Created by Ian Field on 22/03/2016.
//  Copyright © 2016 Ian Field. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    // 4527A0
    static let kDSPurple = UIColor(red: 69.0/255.0, green: 39.0/255.0, blue: 160.0/255.0, alpha: 1.0)
    // 00E676
    static let kDSGreen = UIColor(red: 0.0/255.0, green: 230.0/255.0 , blue: 118.0/255.0, alpha: 1.0)
}

@objc class Constants : NSObject {
    @objc static func purple() -> UIColor {
        return Constant.kDSPurple
    }
}