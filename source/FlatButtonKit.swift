//
//  FlatButtonKit.swift
//
//  Created by keygx on 2015/07/21.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

public enum ButtonStatus {
    case normal
    case highlighted
    case selected
    case disabled
}

public struct ButtonTitle {
    public var normal:      String = ""
    public var highlighted: String = ""
    public var selected:    String = ""
    public var disabled:    String = ""
}

open class FlatButtonKit: UILabel {
    
    // UIButton同様のステータスを保持する
    public var status: ButtonStatus = .normal {
        didSet {
            apply()
        }
    }
    
    // enabledの状態に合わせButtonStatusを更新
    override open var isEnabled: Bool {
        set {
            super.isEnabled = newValue
            
            if isEnabled {
                status = .normal
            } else {
                status = .disabled
            }
        }
        get {
            return super.isEnabled
        }
    }
    
    // highlightedの状態に合わせButtonStatusを更新
    override open var isHighlighted: Bool {
        set {
            super.isHighlighted = newValue
            
            if isHighlighted {
                status = .selected
            } else {
                status = .normal
            }
        }
        get {
            return super.isHighlighted
        }
    }
    
    // ボタンのラベル名の設定
    public var title = ButtonTitle()
    
    private var target: Any?
    private var selector: Selector?
    private var clickHandler: ((FlatButtonKit) -> Void)?
    
    // コードで生成した時に呼ばれる
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    // xibなどでつくったときに呼ばれる
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    private func initialize() {
        // 初期ステータス設定
        status = .normal
        
        // ユーザインタラクションを有効
        isUserInteractionEnabled = true
        
        // 同時押下禁止
        isExclusiveTouch = true
        
        // ジェスチャー設定
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(pressGestureHandler(_:)))
        longPressGestureRecognizer.minimumPressDuration = 0.1
        longPressGestureRecognizer.allowableMovement = 10.0
        addGestureRecognizer(longPressGestureRecognizer)
    }
    
    // ジェスチャーイベント処理
    @objc internal func pressGestureHandler(_ sender: UILongPressGestureRecognizer) {
        
        // disabled は処理しない
        if status == .disabled {
            return
        }
        
        // ボタンが押された時の処理
        if sender.state == .began {
            // 開始
            status = .highlighted
        }
        if sender.state == .ended {
            // 終了
            status = .normal
            
            // メソッドが設定されていれば実行
            if let t: Any = target, let s: Selector = selector {
                if (t as AnyObject).responds(to: s) {
                    let timer = Timer.scheduledTimer(timeInterval: 0.0, target: t, selector: s, userInfo: self, repeats: false)
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
    public func setTarget(target : Any, selector: Selector) {
        self.target = target
        self.selector = selector
    }
    
    // ハンドラの設定
    public func setClickHandler(_ handler: @escaping ((FlatButtonKit) -> Void)) {
        clickHandler = handler
    }
    
    // ボタンスタイルの適用
    private func apply() {
        
        // Disabled
        if status == .disabled {
            if !title.disabled.isEmpty {
                text = title.disabled
            }
            setButtonStyle(status: .disabled)
            return
        }
        
        // Highlighted
        if status == .highlighted {
            if !title.highlighted.isEmpty {
                text = title.highlighted
            }
            setButtonStyle(status: .highlighted)
            return
        }
        
        // Selected
        if status == .selected {
            if !title.selected.isEmpty {
                text = title.selected
            }
            setButtonStyle(status: .selected)
            return
        }
        
        // Normal
        if !title.normal.isEmpty {
            text = title.normal
        }
        setButtonStyle(status: .normal)
    }
    
    // ボタンスタイルの設定
    open func setButtonStyle(status: ButtonStatus) {}
    
}

