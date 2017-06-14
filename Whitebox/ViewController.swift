//
//  ViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var _tableView: UITableView!
    
    let cellTitles = ["Silent button",
                      "Audio jack",
                      "Volume buttons",
                      "Brightness",
                      "Battery",
                      "Device Motion",
                      "Microphone",
                      "Location",
                      "Touch id",
                      "Camera",
                      "Proximity",
                      "Screenshot",
                      "Vibrate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        let label:UILabel! = cell.contentView.viewWithTag(100) as! UILabel!
        label.text = cellTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        
        let title = cellTitles[indexPath.row]
        
        switch title {
            
        case "Silent button":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SilentButtonViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Audio jack":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AudioJackViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Volume buttons":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "VolumeViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Brightness":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BrightnessViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Battery":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BatteryViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Device Motion":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AccelerometerViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Microphone":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MicrophoneViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Touch id":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TouchIDViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Camera":
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MicrophoneViewControllerID")
//            vc?.title = title
//            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Proximity":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProximityViewControllerID")
            vc?.title = title
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Screenshot":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScreenshotViewControllerID")
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case "Vibrate":
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MicrophoneViewControllerID")
//            vc?.title = title
//            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        default:
            break
        }
        
    }

}

