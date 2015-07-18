//
//  FlatButtonKit.swift
//
//  Created by keygx on 2015/07/17.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

public enum ButtonStatus {
    case Normal
    case Highlighted
    case Selected
    case Disabled
}

public struct ButtonTitle {
    public var normal:      String = ""
    public var highlighted: String = ""
    public var selected:    String = ""
    public var disabled:    String = ""
}

public class FlatButtonKit: UILabel {
    
    // UIButton同様のステータスを保持する
    public var status: ButtonStatus = .Normal {
        didSet {
            apply()
        }
    }
    
    // enabledの状態に合わせButtonStatusを更新
    override public var enabled: Bool {
        set {
            super.enabled = newValue
            
            if enabled {
                status = .Normal
            } else {
                status = .Disabled
            }
        }
        get {
            return super.enabled
        }
    }
    
    // highlightedの状態に合わせButtonStatusを更新
    override public var highlighted: Bool {
        set {
            super.highlighted = newValue
            
            if highlighted {
                status = .Selected
            } else {
                status = .Normal
            }
        }
        get {
            return super.highlighted
        }
    }
    
    // ボタンのラベル名の設定
    public var title = ButtonTitle()
    
    private weak var target: AnyObject?
    private var selector: Selector?
    private var clickHandler: ((FlatButtonKit) -> Void)?
    
    // コードで生成した時に呼ばれる
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    // xibなどでつくったときに呼ばれる
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    private func initialize() {
        // 初期ステータス設定
        status = .Normal
        
        // ユーザインタラクションを有効
        self.userInteractionEnabled = true
        
        // ジェスチャー設定
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "pressGestureHandler:")
        longPressGestureRecognizer.minimumPressDuration = 0.1
        longPressGestureRecognizer.allowableMovement = 10.0
        self.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    // ジェスチャーイベント処理
    internal func pressGestureHandler(sender: UILongPressGestureRecognizer) {
        
        // disabled は処理しない
        if status == .Disabled {
            return
        }
        
        // .Selected時の処理
        if status == .Selected {
            return
        }
        
        // ボタンが押された時の処理
        if sender.state == .Began {
            // 開始
            status = .Highlighted
        }
        if sender.state == .Ended {
            // 終了
            status = .Normal
            
            // メソッドが設定されていれば実行
            if let t: AnyObject = target, let s: Selector = selector {
                if t.respondsToSelector(s) {
                    let timer = NSTimer.scheduledTimerWithTimeInterval(0.0, target: t, selector: s, userInfo: self, repeats: false)
                    timer.fire()
                }
            }
            
            // ハンドラが設定されていれば実行
            if let handler = clickHandler {
                handler(self)
            }
        }
    }
    
    // ターゲットメソッドの設定
    public func setTarget(#target : AnyObject, selector: Selector) {
        self.target = target
        self.selector = selector
    }
    
    // ハンドラの設定
    public func setClickHandler(handler: (FlatButtonKit) -> Void) {
        self.clickHandler = handler
    }
    
    // ボタンスタイルの適用
    private func apply() {
        
        // Disabled
        if status == .Disabled {
            if count(title.disabled) > 0 {
                self.text = title.disabled
            }
            self.setButtonStyle(.Disabled)
            return
        }
        
        // Highlighted
        if status == .Highlighted {
            if count(title.highlighted) > 0 {
                self.text = title.highlighted
            }
            self.setButtonStyle(.Highlighted)
            return
        }
        
        // Selected
        if status == .Selected {
            if count(title.selected) > 0 {
                self.text = title.selected
            }
            self.setButtonStyle(.Selected)
            return
        }
        
        // Normal
        if count(title.normal) > 0 {
            self.text = title.normal
        }
        self.setButtonStyle(.Normal)
    }
    
    // ボタンスタイルの設定
    public func setButtonStyle(status: ButtonStatus) {}
    
}
