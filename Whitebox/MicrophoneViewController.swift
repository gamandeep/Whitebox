//
//  MicrophoneViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophoneViewController: BaseTitleViewController, AVAudioRecorderDelegate {

    var audioRecorder:AVAudioRecorder? = nil
    var levelTimer:Timer? = nil
    var fontSize:CGFloat = 0.0
    var lowPassResults:Double = 0.0
    
    func initalizeRecorder ()
    {
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
            
        }catch{
            self.setText("Error");
        }
        
        let stringDir:NSString = self.getDocumentsDirectory() as NSString;
        let audioFilename = stringDir.appendingPathComponent("recording.m4a")
        let audioURL = NSURL(fileURLWithPath: audioFilename)

        // make a dictionary to hold the recording settings so we can instantiate our AVAudioRecorder
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1 as NSNumber,
            AVEncoderBitRateKey:12800 as NSNumber,
            AVLinearPCMBitDepthKey:16 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ] as [String : Any]
        
        do {
            if audioRecorder == nil
            {
                audioRecorder = try AVAudioRecorder(url: audioURL as URL, settings: settings )
                audioRecorder!.delegate = self
                audioRecorder!.prepareToRecord();
                audioRecorder!.isMeteringEnabled = true;
            }
        } catch {
            self.setText("Error");
        }
        
    }
    
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSize = self._label.font.pointSize
        self.setText("Blow me")
        let recordingSession = AVAudioSession.sharedInstance()
        recordingSession.requestRecordPermission() { [unowned self] (allowed: Bool) -> Void in
            DispatchQueue.main.async {
                if allowed {
                    print("Allowd Permission Record!!")
                    self.initalizeRecorder ()
                    self.audioRecorder!.record()
                    
                    //instantiate a timer to be called with whatever frequency we want to grab metering values
                    self.levelTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(MicrophoneViewController.levelTimerCallback), userInfo: nil, repeats: true)
                    
                } else {
                    // failed to record!
                    self.setText("Failed Permission Record!!")
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func levelTimerCallback() {
        //we have to update meters before we can get the metering values
        if audioRecorder != nil
        {
            audioRecorder!.updateMeters()
            
            let ALPHA : Double = 0.05;
            let peakPowerForChannel : Double = pow(Double(10.0), (0.05) * Double(audioRecorder!.averagePower(forChannel: 0)));
            lowPassResults = ALPHA * peakPowerForChannel + Double((1.0) - ALPHA) * lowPassResults;
            print("low pass res = \(lowPassResults)");
            self._label.font = UIFont(name: self._label.font.fontName, size: CGFloat(lowPassResults+1.0)*self.fontSize)
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if audioRecorder != nil
        {
            audioRecorder!.stop()
            self.levelTimer?.invalidate()
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
