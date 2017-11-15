//
//  ViewController.swift
//  Temperatures
//
//  Created by Maribel Montejano on 11/14/17.
//  Copyright © 2017 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(component)
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("titleForRow row: \(row), component \(component)")
        let rows = createRows()
        return String(rows[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow \(row)")
        let tempF = celsiusToF(celsius: Double(row))
        tempLabel.text = String(format: "%.2f", tempF)
    }
    
    func celsiusToF(celsius: Double) -> Double {
        return celsius * 9/5 + 32
    }
    
    func createRows() -> [Int] {
        var rowsArray = [Int]()
        for index in -50...150 {
            rowsArray.append(index)
        }
        return rowsArray
    }
}

