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
        textAlignment = NSTextAlignment.center
        font = UIFont.boldSystemFont(ofSize: CGFloat(16.0))
        layer.masksToBounds = true
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        
        let defaultBlue: UIColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        switch status {
        case .disabled:
            // Disabledのスタイルを設定
            backgroundColor = UIColor.white
            layer.borderColor = UIColor.lightGray.cgColor
            textColor = UIColor.lightGray
            
        case .highlighted:
            // Highlightのスタイルを設定
            backgroundColor = defaultBlue
            layer.borderColor = defaultBlue.cgColor
            textColor = UIColor.white
            
        case .selected:
            // Selectedのスタイルを設定
            backgroundColor = UIColor.orange
            layer.borderColor = UIColor.orange.cgColor
            textColor = UIColor.white
            
        default:
            // Normalのスタイルを設定
            backgroundColor = UIColor.white
            layer.borderColor = defaultBlue.cgColor
            textColor = defaultBlue
        }
    }
}
