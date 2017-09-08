//
//  Loader.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation
import SVProgressHUD

class Loader {
    static func show() {
        SVProgressHUD.setBackgroundColor(UIColor.black)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.show(with: .clear)
    }
    
    static func dismiss() {
        SVProgressHUD.dismiss()
    }
}
