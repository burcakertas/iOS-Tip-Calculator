//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by BURCAKER on 13.11.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    var resultLabelText: String?
    var expLabelText: String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultLabelText
        expLabel.text = expLabelText
        // Do any additional setup after loading the view.
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
