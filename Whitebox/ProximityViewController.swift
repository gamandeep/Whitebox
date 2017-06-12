//
//  ProximityViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 12/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit

class ProximityViewController: BaseTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setText("Hide me")
        UIDevice.current.isProximityMonitoringEnabled = true
        
        if UIDevice.current.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(forName: Notification.Name.UIDeviceProximityStateDidChange, object: nil, queue: nil, using: { (notification) in
                let device = notification.object as! UIDevice
                
                    UIView.animate(withDuration: 0.5, animations: {
                        if device.proximityState == true {
                            self._label.alpha = 0.0
                        }
                        else {
                            self._label.alpha = 1.0
                        }
                    })
            })
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
