//
//  AudioJackViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit
import AVFoundation

class AudioJackViewController: BaseTitleViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try? AVAudioSession.sharedInstance().setActive(true)
        self.setHeadSetPluggedIn()
        NotificationCenter.default.addObserver(forName: .AVAudioSessionRouteChange, object: nil, queue: nil) { (notification) in
            DispatchQueue.main.async {
                self.audioRouteChangeListener(notification)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func setHeadSetPluggedIn () {
        let route = AVAudioSession.sharedInstance().currentRoute
        
        for desc in route.outputs {
            if desc.portType == AVAudioSessionPortHeadphones {
                self.setText("Headphones plugged in")
            }
        }
        self.setText("Headphones plugged out")
    }
    
    func audioRouteChangeListener(_ notification:Notification) {
        let audioRouteChangeReason = notification.userInfo![AVAudioSessionRouteChangeReasonKey] as! UInt
        
        switch audioRouteChangeReason {
        case AVAudioSessionRouteChangeReason.newDeviceAvailable.rawValue:
            self.setText("Headphones plugged in")
        case AVAudioSessionRouteChangeReason.oldDeviceUnavailable.rawValue:
            self.setText("Headphones plugged out")
        default:
            break
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
