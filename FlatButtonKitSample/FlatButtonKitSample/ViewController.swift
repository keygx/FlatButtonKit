//
//  ViewController.swift
//  FlatButtonKitSample
//
//  Created by keygx on 2015/07/21.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: SampleButtonStyle!
    @IBOutlet weak var btn1: SampleButtonStyle!
    @IBOutlet weak var btn2: SampleButtonStyle!
    @IBOutlet weak var btn3: SampleButtonStyle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.title.normal = "Normal"
        button.tag = 1
        
        // set Touch Event
        button.setTarget(target: self, selector: "didTapped:")
        
        // set Click Handler
        button.setClickHandler() { sender in
            println("ClickHandler: \(sender.tag)")
        }
        
        
        btn1.tag = 11
        btn1.setTarget(target: self, selector: "didBtnTapped:")
        
        btn2.tag = 12
        btn2.setTarget(target: self, selector: "didBtnTapped:")
        
        btn3.tag = 13
        btn3.setTarget(target: self, selector: "didBtnTapped:")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Receive Touch Event
    func didTapped(sender: NSTimer) {
        if let sender: AnyObject = sender.userInfo {
            println("didTapped: \(sender.tag)")
        }
    }
    
    @IBAction func styleNormal(sender: AnyObject) {
        button.title.normal = "Normal"
        button.status = .Normal
    }
    
    @IBAction func styleHighlighted(sender: AnyObject) {
        button.title.highlighted = "Highlighted"
        button.status = .Highlighted
    }
    
    @IBAction func styleSelected(sender: AnyObject) {
        button.title.selected = "Selected"
        button.status = .Selected
    }
    
    @IBAction func styleDisabled(sender: AnyObject) {
        button.title.disabled = "Disabled"
        button.status = .Disabled
    }
    
    // btn1, btn2, btn3
    func didBtnTapped(sender: NSTimer) {
        if let sender: AnyObject = sender.userInfo {
            println("didBtnTapped: \(sender.tag)")
        }
    }
}
