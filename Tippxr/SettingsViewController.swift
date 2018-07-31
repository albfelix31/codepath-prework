//
//  SettingsViewController.swift
//  Tippxr
//
//  Created by Albert Felix on 7/30/18.
//  Copyright © 2018 Albert Felix. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let savedTip = defaults.integer(forKey: "default tip")

        //tipPercentControl.selectedSegmentIndex = savedTip
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDefaultPercentChanged(_ sender: Any) {
       let index = tipPercentControl.selectedSegmentIndex
        defaults.set(index, forKey: "default tip")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
    
        let percentIndex = defaults.integer(forKey: "default tip")
        tipPercentControl.selectedSegmentIndex = percentIndex
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
