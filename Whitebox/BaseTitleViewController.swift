//
//  BaseTitleViewController.swift
//  Whitebox
//
//  Created by Gamandeep Sethi on 11/06/17.
//  Copyright © 2017 Gamandeep Sethi. All rights reserved.
//

import UIKit

class BaseTitleViewController: UIViewController {

    @IBOutlet weak var _label: UILabel!
    @IBOutlet weak var _imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setText (_ text : String) {
        self.setText(text, with:1.0)
    }
    
    func setText (_ text: String, with duration: Double) {
        UIView.transition(with: self._label, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            self._label.text = text
        }, completion: nil)
    }
    
    func setImage (_ image: UIImage) {
        UIView.transition(with: self._label, duration: 1.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            self._imageView.image = image
        }, completion: nil)
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
