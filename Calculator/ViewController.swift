//
//  ViewController.swift
//  Calculator
//
//  Created by İrem's Mac on 11.10.2018.
//  Copyright © 2018 iremozdemir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    @IBOutlet weak var label: UILabel!
    var operation : Double = 0
    var performingMath = false
    
    @IBOutlet weak var dividedButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numbers(_ sender: Any) {
        if performingMath == true{
            label.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }else{
        label.text = label.text! + String((sender as AnyObject).tag - 1)
        numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func operations(_ sender: Any) {
        
        //18:seperator
        //17:changer +/-
        if (label.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16 && (sender as AnyObject).tag != 17 && (sender as AnyObject).tag != 18){
            previousNumber = Double(label.text!)!
            if((sender as AnyObject).tag == 12){
                
                operation = 12
                dividedButton.backgroundColor = UIColor.white
                dividedButton.setTitleColor(UIColor.darkGray, for: .normal)
            }else if((sender as AnyObject).tag == 13){
                operation = 13
                multiplyButton.backgroundColor = UIColor.white
                multiplyButton.setTitleColor(UIColor.darkGray, for: .normal)
            }else if((sender as AnyObject).tag == 14){
                operation = 14
                minusButton.backgroundColor = UIColor.white
                minusButton.setTitleColor(UIColor.darkGray, for: .normal)
            }else if((sender as AnyObject).tag == 15){
                operation = 15
                plusButton.backgroundColor = UIColor.white
                plusButton.setTitleColor(UIColor.darkGray, for: .normal)
            }
            performingMath = true
        }else if (sender as AnyObject).tag == 16{
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
                dividedButton.backgroundColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1.0)
                dividedButton.setTitleColor(UIColor.white, for: .normal)
            }else if operation == 13{
                label.text = String(previousNumber * numberOnScreen)
                multiplyButton.backgroundColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1.0)
                multiplyButton.setTitleColor(UIColor.white, for: .normal)
            }else if operation == 14{
                label.text = String(previousNumber - numberOnScreen)
                minusButton.backgroundColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1.0)
                minusButton.setTitleColor(UIColor.white, for: .normal)
            }else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
                plusButton.backgroundColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1.0)
                plusButton.setTitleColor(UIColor.white, for: .normal)
            }
        }else if (sender as AnyObject).tag == 11{
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }else if(sender as AnyObject).tag == 17{
            numberOnScreen = Double(label.text!)!
            numberOnScreen = numberOnScreen * -1
            label.text = String(numberOnScreen)
        }else if(sender as AnyObject).tag == 18{
            numberOnScreen = Double(label.text!)!
            let num = Int(numberOnScreen)
            label.text = String(num) + "."
        }
        
    }

}

