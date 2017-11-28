//
//  Binary-HexViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 10/1/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class Binary_HexViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var digitTouched = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func numbersLetters(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digitTouched {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        }else {
            displayLabel.text = digit
            digitTouched = true
        }
        

    }
    
    func convertToHex(binary: Int) -> String {
        var num = 0;
        var bArray: [Character] = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
        var emptyString: String = ""
        num = convertToDecimal(binaryVal: binary)
        while num>0 {
            emptyString = String(bArray[num % 16]) +  emptyString
            num /= 16
        }
        
        return emptyString
        
        
    }
    
    func convertToDecimal(binaryVal: Int) -> Int {
        
        var num = 0, c = 0,i:Double = 0, result = 0
        
        num = binaryVal
        
        while num != 0 {
            
            c = num % 10
            
            num = num / 10
            result += c * Int(pow(2, i))
            i += 1
            
            
        }
        
        return result
    }
    
    func convertToBinary(hex: String) -> String {
        
        var num = 0, c = 0,i = 1, result = 0
        
        num = convertToDecimal(Hex: hex)
        
        while num != 0 {
            
            c = num % 2
            
            num = num / 2
            result += c * i
            i *= 10
        }
        return "\(result)"
        
    }
    

        
        func convertToDecimal(Hex: String) -> Int {
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
            return d
        }



    


    @IBAction func Binary(_ sender: UIButton) {
        displayLabel.text = convertToBinary(hex: displayLabel.text!)
        
    }
    
    
    @IBAction func Hexadecimal(_ sender: UIButton) {
        displayLabel.text = convertToHex(binary: (displayLabel.text! as NSString).integerValue)
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        displayLabel.text = ""

    }
    
   }
