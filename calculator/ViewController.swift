//
//  ViewController.swift
//  calculator
//
//  Created by Joey Kurkjian on 4/11/18.
//  Copyright © 2018 Joey Kurkjian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var negative: Bool = false
    var operand: Double = 0
    var op: Int = -1
    var newNum: Bool = true
    
    @IBAction func buttonHandler(_ sender: UIButton) {
        if sender.tag == -1 {
            label.text = "0"
            operand = 0
            op = -1
        }
        if sender.tag == 16 {
            mathHandler(operand2: label.text!)
            newNum = true
        }
        if sender.tag == 17 {
            if newNum {
                label.text = "0."
                newNum = false
            }
            else {
                label.text = label.text! + "."
            }
        }
        if sender.tag == 15 {
            if negative {
                label.text = String((label.text?.suffix((label.text?.count)! - 1))!)
                negative = false
            }
            else {
                label.text = "-" + label.text!
                negative = true
            }
        }
        if sender.tag > 9 && sender.tag < 15 {
            operand = Double(label.text!)!
            op = sender.tag
            newNum = true
        }
        if sender.tag >= 0 && sender.tag < 10 {
            if newNum{
                label.text = String(sender.tag)
                newNum = false
            }
            else if label.text != "0"{
                label.text = label.text! + String(sender.tag)
            }
        }
        
    }
    
    func mathHandler(operand2: String) {
        let num: Double = Double(operand2)!
        if op == 10 {
            if num + self.operand == floor(num + self.operand) {
                self.label.text = String(Int(num + self.operand))
            }
            else {
                self.label.text = String(num + self.operand)
            }
        }
        else if op == 11 {
            if self.operand - num == floor(self.operand - num) {
                self.label.text = String(Int(self.operand - num))
            }
            else {
                self.label.text = String(self.operand - num)
            }
        }
        else if op == 12 {
            if num * self.operand == floor(num * self.operand) {
                self.label.text = String(Int(num * self.operand))
            }
            else {
                self.label.text = String(num * self.operand)
            }
        }
        else if op == 13 {
            if self.operand / num == floor(self.operand / num) {
                self.label.text = String(Int(self.operand / num))
            }
            else {
                self.label.text = String(self.operand / num)
            }
        }
        else if op == 14 {
            if self.operand.truncatingRemainder(dividingBy: num) == floor(self.operand.truncatingRemainder(dividingBy: num)) {
                self.label.text = String(Int(self.operand.truncatingRemainder(dividingBy: num)))
            }
            else {
                self.label.text = String(self.operand.truncatingRemainder(dividingBy: num))
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
