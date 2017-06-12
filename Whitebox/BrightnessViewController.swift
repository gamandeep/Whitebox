//
//  BrightnessViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit

class BrightnessViewController: BaseTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setText("".appendingFormat("Brightness\n%0.2f", UIScreen.main.brightness))
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIScreenBrightnessDidChange, object: nil, queue: nil) { (notification) in
            self.setText("".appendingFormat("Brightness\n%0.2f", UIScreen.main.brightness), with:0.2)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
