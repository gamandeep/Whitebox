//
//  VolumeViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit
import AVFoundation

class VolumeViewController: BaseTitleViewController {

    let audioSession = AVAudioSession.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listenVolumeButton()
        // Do any additional setup after loading the view.
    }
    
    func listenVolumeButton(){
        try? audioSession.setActive(true)
        self.setText("Volume\n\(audioSession.outputVolume)")
        audioSession.addObserver(self, forKeyPath: "outputVolume",
                                 options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume" {
            self.setText("Volume\n\(change?.first?.value as! NSNumber)", with:0.2)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        audioSession.removeObserver(self, forKeyPath: "outputVolume")
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
