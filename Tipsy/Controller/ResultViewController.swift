//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Илья Шаповалов on 17.04.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var describeLabel: UILabel!
    
    var result: String?
    var describe: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = result
        describeLabel.text = describe
    }
    
    @IBAction func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
