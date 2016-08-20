//
//  ViewController.swift
//  FlatButtonKitSample
//
//  Created by keygx on 2015/07/21.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var button: SampleButtonStyle!
    weak var btn1: SampleButtonStyle!
    weak var btn2: SampleButtonStyle!
    weak var btn3: SampleButtonStyle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.title.normal = "Normal"
        button.title.highlighted = "Highlighted"
        button.title.selected = "Selected"
        button.title.disabled = "Disabled"
        button.status = .normal
        button.tag = 1
        
        // set Touch Event
        button.setTarget(target: self, selector: #selector(didTapped(_:)))
        
        // set Click Handler
        button.setClickHandler() { sender in
            print("ClickHandler: \(sender.tag)")
        }
        
        
        btn1.tag = 11
        btn1.setTarget(target: self, selector: #selector(didBtnTapped(_:)))
        
        btn2.tag = 12
        btn2.setTarget(target: self, selector: #selector(didBtnTapped(_:)))
        
        btn3.tag = 13
        btn3.setTarget(target: self, selector: #selector(didBtnTapped(_:)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Receive Touch Event
    func didTapped(_ sender: Timer) {
        sender.userInfo.flatMap {
            print("didTapped: \(($0 as AnyObject).tag)")
        }
    }
    
    @IBAction func styleNormal(_ sender: AnyObject) {
        button.status = .normal
    }
    
    @IBAction func styleHighlighted(_ sender: AnyObject) {
        button.status = .highlighted
    }
    
    @IBAction func styleSelected(_ sender: AnyObject) {
        button.status = .selected
    }
    
    @IBAction func styleDisabled(_ sender: AnyObject) {
        button.status = .disabled
    }
    
    // btn1, btn2, btn3
    func didBtnTapped(_ sender: Timer) {
        sender.userInfo.flatMap {
            print("didTapped: \(($0 as AnyObject).tag)")
        }
    }
}
