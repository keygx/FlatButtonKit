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
        self.textAlignment = NSTextAlignment.center
        self.font = UIFont.boldSystemFont(ofSize: CGFloat(16.0))
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        
        let defaultBlue: UIColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        switch status {
        case .disabled:
            // Disabledのスタイルを設定
            self.backgroundColor = UIColor.white
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.textColor = UIColor.lightGray
            
        case .highlighted:
            // Highlightのスタイルを設定
            self.backgroundColor = defaultBlue
            self.layer.borderColor = defaultBlue.cgColor
            self.textColor = UIColor.white
            
        case .selected:
            // Selectedのスタイルを設定
            self.backgroundColor = UIColor.orange
            self.layer.borderColor = UIColor.orange.cgColor
            self.textColor = UIColor.white
            
        default:
            // Normalのスタイルを設定
            self.backgroundColor = UIColor.white
            self.layer.borderColor = defaultBlue.cgColor
            self.textColor = defaultBlue
        }
    }
}
