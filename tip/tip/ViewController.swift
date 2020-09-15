//
//  ViewController.swift
//  tip
//
//  Created by Weirong Wu on 9/7/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.text = ""
    }
    
    var runningNumber = ""

    @IBAction func numberPressed(_ sender: KeyPad) {
        runningNumber += "\(sender.tag)"
        billAmountTextField.text = runningNumber
        calculateTip(KeyPad())
    }
    
    
    @IBAction func dotPressed(_ sender: KeyPad) {
        runningNumber += "."
        billAmountTextField.text = runningNumber
        calculateTip(KeyPad())
    }
    
    @IBAction func clearPressed(_ sender: KeyPad) {
        if billAmountTextField.text?.isEmpty == false {
            billAmountTextField.text?.removeLast()
        }
        runningNumber = billAmountTextField.text ?? ""
        calculateTip(KeyPad())
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips
        // let bill = Double(billAmountTextField.text!) ?? 0
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
}

 
