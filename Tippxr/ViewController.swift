//
//  ViewController.swift
//  Tippxr
//
//  Created by Albert Felix on 7/29/18.
//  Copyright © 2018 Albert Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoTab: UILabel!
    @IBOutlet weak var threeTab: UILabel!
    @IBOutlet weak var fourTab: UILabel!
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var slideUpButton: UIButton!
    @IBOutlet weak var slideDownButton: UIButton!
    @IBOutlet weak var downBar: UIView!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twoTab.text = "$0.00"
        threeTab.text = "$0.00"
        fourTab.text = "$0.00"

        self.title = "Tip Calculator"
        popUp.alpha = 0
        
        //let percentSetting = defaults.integer(forKey: "default tip")
      //  tipControl.selectedSegmentIndex = percentSetting
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let percentSetting = defaults.integer(forKey: "default tip")
        
        tipControl.selectedSegmentIndex = percentSetting
    }


    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.18, 0.20, 0.25]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let twoP = total/2
        let threeP = total/3
        let fourP = total/4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoTab.text = String(format: "$%.2f", twoP)
        threeTab.text = String(format: "$%.2f", threeP)
        fourTab.text = String(format: "$%.2f", fourP)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func slideUp(_ sender: Any) {
        UIView.animate(withDuration: 0.4, delay: 0.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 4, options: [], animations: { () -> Void in self.popUp.alpha = 1 }, completion: nil)
            
        //popUp.alpha = 1
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 4, options: [], animations: { () -> Void in self.downBar.alpha = 0 }, completion: nil)
    }
    
    @IBAction func slideDown(_ sender: Any) {
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 4, options: [], animations: { () -> Void in self.popUp.alpha = 0 }, completion: nil)
        
        //popUp.alpha = 1
        UIView.animate(withDuration: 0.4, delay: 0.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 4, options: [], animations: { () -> Void in self.downBar.alpha = 1 }, completion: nil)
    }
    
}

