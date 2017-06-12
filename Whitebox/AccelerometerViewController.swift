//
//  AccelerometerViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: BaseTitleViewController {

    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.1
            manager.startDeviceMotionUpdates(to: OperationQueue()) {
                [weak self] (data: CMDeviceMotion?, error: Error?) in
                var title:String = ""
                if let acceleration = data?.userAcceleration {
                    title = title.appendingFormat("Acceleration\nX: %0.2f Y: %0.2f", acceleration.x, acceleration.y)
                }
                if let gravity = data?.gravity {
                    title = title.appendingFormat("\n\nGravity\nX: %0.2f Y: %0.2f", gravity.x, gravity.y)
                    let rotation = atan2(gravity.x, gravity.y) - .pi
                    OperationQueue.main.addOperation {
                        self?._label.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
                    }
                }
                OperationQueue.main.addOperation {
                    self?.setText(title, with: 0.2)
                    
                    if let x = data?.userAcceleration.x,
                        x < -2.5 {
                        self?.navigationController?.popViewController(animated: true)
                    }
                }
                
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        manager.stopDeviceMotionUpdates()
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
