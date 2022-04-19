//
//  TipsyLogic.swift
//  Tipsy
//
//  Created by Илья Шаповалов on 19.04.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct TipsyLogic {
    var tip: Double = 10
    var split: Double = 2
    var totalBill: Double = 0
    var totalBillPerPerson: Double = 0
    
    mutating func calculateTips(from button: UIButton) {
        //Take current tip title
        let buttonTitle = button.currentTitle ?? "10%"
        //Drop percentage literal
        let buttonTitleMinusPercent = buttonTitle.dropLast()
        //Convert title into decimal
        let buttonTitleConvertedIntoDouble = Double(buttonTitleMinusPercent)!
        //Calculate tip percentage
        tip = buttonTitleConvertedIntoDouble
    }
    
    func getLabel() -> String {
        return String(format: "%.0f", split)
    }
    
    mutating func calculate(from bill: String) {
        totalBill = Double(bill)!
        totalBillPerPerson = (totalBill * (1 + (tip / 100))) / split
    }
    
    func getResult() -> String {
        return String(format: "%.2f", totalBillPerPerson)
    }
    
    func getDescribe() -> String {
        return "Split between \(Int(split)) people with \(Int(tip))% tip."
    }
    
}
