//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var totalBillField: UITextField!
    @IBOutlet weak var zeroTipsLabel: UIButton!
    @IBOutlet weak var tenTipsLabel: UIButton!
    @IBOutlet weak var twentyTipsLabel: UIButton!
    @IBOutlet weak var stepperLabel: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tip = 0.0
    var split = 2.0
    var totalBill = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalBillField.keyboardType = .numbersAndPunctuation
        tenTipsLabel.isSelected = true
        splitLabel.text = "2"
    }
    //Overrade method to hide keyboard then tapping outside text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        //Make all tips button deselected
        zeroTipsLabel.isSelected = false
        tenTipsLabel.isSelected = false
        twentyTipsLabel.isSelected = false
        //Select current button
        sender.isSelected = true
        //Take current tip title
        let buttonTitle = sender.currentTitle ?? "100%"
        //Drop percentage literal
        let buttonTitleMinusPercent = buttonTitle.dropLast()
        //Convert title into double
        let buttonTitleConvertedIntoDouble = Double(buttonTitleMinusPercent)!
        //Calculate tip percentage
        tip = buttonTitleConvertedIntoDouble / 100
    }
    
    @IBAction func splitTapped(_ sender: UIStepper) {
        //Sett minimum and maximum values for stepper
        sender.minimumValue = 1
        sender.maximumValue = 12
        
        split = sender.value
        //Convert split value into string and set label
        splitLabel.text = String(format: "%.0f", split)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let unwrappedBillField = totalBillField.text ?? "0.0"
        totalBill = Double(unwrappedBillField)!
        let totalTip = (totalBill + (totalBill * tip)) / split
        print(totalBill)
        print(tip)
        print(split)
        print(totalTip)
    }
    
}

