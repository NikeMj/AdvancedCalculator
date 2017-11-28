//
//  Decimal-HexcadecimalViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 9/20/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class Decimal_HexcadecimalViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
     var digitTouched = false
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeNavBar()
    }

    
    @IBAction func numbers(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digitTouched {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        }else {
            displayLabel.text = digit
            digitTouched = true
        }
        

        
    }
    
    @IBAction func letters(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digitTouched {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        }else {
            displayLabel.text = digit
            digitTouched = true
        }
        

    }
    
    func convertToDecimal(Hex: String) -> String {
        var result: Double = 0
        var d: Int = 0
        var m: Int = 0
        var hex: Double = Double((Hex.characters.count) - 1)
        while m < Hex.characters.count {
        for num in Hex.characters{
            var flag = false
            switch(num)
            {
            case "0": result = 0
            case "1": result = 1
            case "2": result = 2
            case "3": result = 3
            case "4": result = 4
            case "5": result = 5
            case "6": result = 6
            case "7": result = 7
            case "8": result = 8
            case "9": result = 9
            case "A": result = 10
            case "B": result = 11
            case "C": result = 12
            case "D": result = 13
            case "E": result = 14
            case "F": result = 15
            default : flag = true;
            }
            if(flag)
            {print("Wrong Entry")
                break;}
                       d = Int(result * pow(16, hex)) + d
                        hex -= 1}
                m = m + 1}
        return "\(d)"
}
    
    func convertToHex(decimal: Int) -> String {
        var num = 0;
        var result: Int = 0;
        var bArray: [Character] = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
        var emptyString: String = ""
        num = decimal
        while num>0 {
            result = num % 16
            emptyString = String(bArray[result]) +  emptyString
            num = num/16
        }
        return emptyString
        

    }
    
    @IBAction func toDecimal(_ sender: UIButton) {

         displayLabel.text = convertToDecimal(Hex: displayLabel.text!)
    }
    
    @IBAction func toHexadecimal(_ sender: UIButton) {
         displayLabel.text = convertToHex(decimal: (displayLabel.text! as NSString).integerValue)
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        displayLabel.text = ""
    }


    func customizeNavBar() {
        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 87/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }


    
  }
