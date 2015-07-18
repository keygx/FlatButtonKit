//
//  SampleButtonStyle.swift
//  FlatButtonKitSample
//
//  Created by keygx on 2015/07/17.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import FlatButtonKit

class SampleButtonStyle: FlatButtonKit {
    
    // ボタンスタイルの設定
    override func setButtonStyle(status: ButtonStatus) {
        
        // 共通のスタイルを設定
        self.textAlignment = NSTextAlignment.Center
        self.font = UIFont.boldSystemFontOfSize(CGFloat(16.0))
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        
        let defaultBlue: UIColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        switch status {
        case .Disabled:
            // Disabledのスタイルを設定
            self.backgroundColor = UIColor.whiteColor()
            self.layer.borderColor = UIColor.lightGrayColor().CGColor
            self.textColor = UIColor.lightGrayColor()
            
        case .Highlighted:
            // Highlightのスタイルを設定
            self.backgroundColor = defaultBlue
            self.layer.borderColor = defaultBlue.CGColor
            self.textColor = UIColor.whiteColor()
            
        case .Selected:
            // Selectedのスタイルを設定
            self.backgroundColor = UIColor.orangeColor()
            self.layer.borderColor = UIColor.orangeColor().CGColor
            self.textColor = UIColor.whiteColor()
            
        default:
            // Normalのスタイルを設定
            self.backgroundColor = UIColor.whiteColor()
            self.layer.borderColor = defaultBlue.CGColor
            self.textColor = defaultBlue
        }
    }
}
