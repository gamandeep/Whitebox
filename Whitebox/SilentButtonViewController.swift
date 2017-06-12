//
//  SilentButtonViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit
import AudioToolbox

class SilentButtonViewController: BaseTitleViewController {
    
    let detector:SharkfoodMuteSwitchDetector = SharkfoodMuteSwitchDetector.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detector.silentNotify = {silent in
            if (silent == true) {
                self.setText("Ringer silent")
            }
            else {
                self.setText("Ringer on")
            }
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
