//
//  UserInputViewController.swift
//  GraphTap
//
//  Created by Iris Bao on 2019-11-06.
//  Copyright © 2019 Yuchen Wei. All rights reserved.
//

import UIKit
import Foundation

class UserInputViewController: UITableViewController {

    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    var inputVaules = [Int]()
    var inputTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueField.delegate = self
        titleField.delegate = self
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let valueInt =  Int(valueField.text!)
        inputVaules.append(valueInt!)
        inputTitles.append(titleField.text!)
        
        let bc = self.storyboard?.instantiateViewController(identifier: "BarChartViewController") as! BarChartViewController
        for i in 0..<inputVaules.count {
            bc.barChartView.dataEntries.append(BarEntry(value: inputVaules[i], title: inputTitles[i]))
        }
        splitViewController?.showDetailViewController(bc, sender: nil)
        
        valueField.text = ""
        titleField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        valueField.resignFirstResponder()
    }
    
}

extension UserInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
