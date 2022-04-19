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
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipsyLogic = TipsyLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalBillField.keyboardType = .decimalPad
        //Sett default tip to 10%
        tenTipsLabel.isSelected = true
        //Sett minimum and maximum values for stepper
        stepper.minimumValue = 1
        stepper.maximumValue = 12
        //Sett default value of slplit
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
        tipsyLogic.calculateTips(from: sender)
    }
    
    @IBAction func splitTapped(_ sender: UIStepper) {
        //Sett split value of stepper
        tipsyLogic.split = sender.value
        //Convert split value into string and set label
        splitLabel.text = tipsyLogic.getLabel()
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        //Replace "," with "." in textField to prevent errors
        let convertedIntoDotField = totalBillField.text?.replacingOccurrences(of: ",", with: ".")
        //Unwrap textfield
        let unwrappedBillField = convertedIntoDotField ?? "0.0"
        tipsyLogic.calculate(from: unwrappedBillField)
        
        self.performSegue(withIdentifier: "calculateTips", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateTips" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = tipsyLogic.getResult()
            destinationVC.describe = tipsyLogic.getDescribe()
        }
    }
}

