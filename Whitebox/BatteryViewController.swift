//
//  BatteryViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit

class BatteryViewController: BaseTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.setBatteryText()
        NotificationCenter.default.addObserver(forName: Notification.Name.UIDeviceBatteryLevelDidChange, object: nil, queue: nil) { (notification) in
            self.setBatteryText()
        }
        NotificationCenter.default.addObserver(forName: Notification.Name.UIDeviceBatteryStateDidChange, object: nil, queue: nil) { (notification) in
            self.setBatteryText()
        }
        // Do any additional setup after loading the view.
    }
    
    func setBatteryText () {
        if UIDevice.current.batteryState == UIDeviceBatteryState.full {
            self.setText("Battery is full")
        }
        else if UIDevice.current.batteryState == UIDeviceBatteryState.charging {
            self.setText("Battery is charging at ".appendingFormat("%0.2f%%", UIDevice.current.batteryLevel*100))
        }
        else if UIDevice.current.batteryState == UIDeviceBatteryState.unplugged {
            self.setText("Battery is discharging at ".appendingFormat("%0.2f%%", UIDevice.current.batteryLevel*100))
        }
        else {
            self.setText("Battery is ".appendingFormat("%0.2f%% charged", UIDevice.current.batteryLevel))
        }
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
