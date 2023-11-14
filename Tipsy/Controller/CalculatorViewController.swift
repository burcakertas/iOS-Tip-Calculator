//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by BURCAKER on 13.11.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    var totalAmount: String = "0.0"
    var expText: String = ""
    
    //Tip Buttons
    @IBOutlet weak var zeroPctButtonPressed: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    //Choose Split
    @IBOutlet weak var splitLabel: UILabel!
    
    //Bill
    @IBOutlet weak var billTextField: UITextField!
    
    @IBAction func splitStepperAction(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.f", sender.value)
    }
    
    @IBAction func zeroPctButtonPressed(_ sender: Any) {
        zeroPctButton.isSelected = true
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func twentyPctButtonPressed(_ sender: Any) {
        twentyPctButton.isSelected = true
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
    }
    
    @IBAction func tenPctButtonPressed(_ sender: Any) {
        tenPctButton.isSelected = true
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        if let billAmountSafe = billTextField.text, let splitLabelSafe = splitLabel.text {
            let billAmountFloat = (billAmountSafe as NSString).floatValue
            let result = calculatorBrain.calculateBillAmount(billAmount: billAmountFloat, tipPct: whichTipAmountSelected(), totalPerson: (splitLabelSafe as NSString).floatValue)
            totalAmount = result.0
            expText = result.1
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func whichTipAmountSelected() -> Int {
        if zeroPctButton.isSelected == true {
            return 0
        } else if tenPctButton.isSelected == true {
            return 10
        } else if twentyPctButton.isSelected == true {
            return 20
        }
        return 0
    }

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.resultLabelText = totalAmount
            destinationVC.expLabelText = expText
        }
    }
    

}
