//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 2022/01/20.
//

import UIKit


enum Operation{
    case Add
    case Subtract
    case Divede
    case Multiply
    case Unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation : Operation = .Unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapClearBtn(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .Unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if self.displayNumber.count < 8 , !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    
    @IBAction func tapNumberBtn(_ sender: UIButton) {
        print("dsdsd")
        guard let numValue = sender.titleLabel?.text else {return}
        if displayNumber.count < 9{
            self.displayNumber += numValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideBtn(_ sender: UIButton) {
        self.operation(.Divede)
    }
    @IBAction func tapMultiplyBtn(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    @IBAction func tapSubtractBtn(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    @IBAction func tapPlusBtn(_ sender: UIButton) {
        self.operation(.Add)
    }
    @IBAction func tapEqualBtn(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation ){
        if self.currentOperation != .Unknown{
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else {return}
                
                switch self.currentOperation{
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .Divede:
                    self.result = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result) , result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        }else{
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
    
}

