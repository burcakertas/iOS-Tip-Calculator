//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by BURCAKER on 13.11.2023.
//

import UIKit

struct CalculatorBrain {
    
    func calculateBillAmount(billAmount: Float,tipPct: Int, totalPerson: Float) -> (String, String) {
        let tipAmount = billAmount*(Float(tipPct)/100.0)
        let totalAmount = (billAmount + tipAmount) / totalPerson
        let totalAmountString = String(format: "%.2f", totalAmount)
        let expText = "Split between " + String(format: "%.f",totalPerson) + " people, with "  + "\(tipPct)" + "% tip."
        return (totalAmountString, expText)
    }
}
