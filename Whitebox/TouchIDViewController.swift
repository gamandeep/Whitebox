//
//  TouchIDViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDViewController: BaseTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            error: &error) {
            
            // Device can use TouchID
            
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Access requires authentication",
                reply: {(success, error) in
                    DispatchQueue.main.async {
                        
                        if error != nil {
                            
                            switch error!._code {
                                
                            case LAError.Code.systemCancel.rawValue:
                                self.notifyUser("Session cancelled",
                                                err: error?.localizedDescription)
                                
                            case LAError.Code.authenticationFailed.rawValue:
                                UIView.transition(with: self._label, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                                    self._label.textColor = UIColor.red
                                    self._label.text = "Access denied\nTry again"
                                }, completion: nil)
                                
                                UIView.animate(withDuration: 0.5 , delay: 0.0, options:
                                    [
                                        UIViewAnimationOptions.curveEaseInOut,
                                        UIViewAnimationOptions.autoreverse,
                                        UIViewAnimationOptions.repeat,
                                        UIViewAnimationOptions.allowUserInteraction
                                    ], 
                                    animations: {
                                        self._label.alpha = 0.1
                                }, completion: {Bool in
                                })
                                
                            case LAError.Code.userFallback.rawValue:
                                self.notifyUser("Authentication",
                                                err: "Password option selected")
                                // Custom code to obtain password here
                                
                            default:
                                self.notifyUser("Authentication failed",
                                                err: error?.localizedDescription)
                            }
                            
                        } else {
                            UIView.transition(with: self._label, duration: 0.5, options: [UIViewAnimationOptions.transitionCrossDissolve], animations: {
                                self._label.textColor = UIColor.green
                                self._label.text = "Access granted"
                            }, completion: nil)
                        }
                    }
            })
            
        } else {
            // Device cannot use TouchID
            switch error!.code{
                
            case LAError.Code.touchIDNotEnrolled.rawValue:
                notifyUser("TouchID is not enrolled",
                           err: error?.localizedDescription)
                
            case LAError.Code.passcodeNotSet.rawValue:
                notifyUser("A passcode has not been set",
                           err: error?.localizedDescription)
                
            default:
                notifyUser("TouchID not available",
                           err: error?.localizedDescription)
                
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func notifyUser(_ msg: String, err: String?) {
        let alert = UIAlertController(title: msg,
                                      message: err,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true,
                     completion: nil)
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
