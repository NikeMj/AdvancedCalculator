//
//  Binar-OctalViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 9/23/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class Binar_OctalViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
  var digitTouched = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    func convertToBinary(octal: Int) -> String {
        
        var num = 0
        var result = 0, c:Double=0
        var binaryNum = 0
        num = octal
        
        while num != 0 {
            result += (num % 10) * Int(pow(8, c))
            c += 1
            num = num / 10
          
            
        }
        
        c = 1
        while result != 0 {
            binaryNum += (result % 2) * Int(c)
            result /= 2
            c *= 10
        }
               return "\(binaryNum)"
        
    }
    
    
        func convertToOctal(binary: Int) -> String {
            var num = 0
            var result = 0, c:Double=0
            var binaryNum = 0
            num = binary
            
            while num != 0 {
                result += (num % 10) * Int(pow(2, c))
                c += 1
                num = num / 10
                
                
            }
            
            c = 1
            while result != 0 {
                binaryNum += (result % 8) * Int(c)
                result /= 8
                c *= 10
            }
            return "\(binaryNum)"
    }
    


    
    @IBAction func convertToBinary(_ sender: UIButton) {
         displayLabel.text = convertToBinary(octal: (displayLabel.text! as NSString).integerValue)
    }
    
    @IBAction func convertToOctal(_ sender: UIButton) {
         displayLabel.text = convertToOctal(binary: (displayLabel.text! as NSString).integerValue)
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
