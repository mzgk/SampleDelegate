//
//  ParentViewController.swift
//  DelegateSample
//
//  Created by mzgk on 2015/09/21.
//  Copyright © 2015年 mzgk. All rights reserved.
//

/// 依頼される側

import UIKit

/// 1.プロトコルに準拠
class ParentViewController: UIViewController, ModalViewControllerDelegate {

    @IBOutlet weak var modalTextLabel: UILabel!
    var modalView: ModalViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        modalView = self.storyboard?.instantiateViewControllerWithIdentifier("ModalViewStoryBoard") as! ModalViewController
        /// 2.デリゲートインスタンスに自身をセット
        modalView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showModal(sender: UIButton) {
        self.presentViewController(modalView, animated: true, completion: nil)
    }

    /// 3.デリゲートメソッドの実装（ModalVC側からコールされる）
    func modalDidFinished(modalText: String) {
        modalTextLabel.text = modalText
        self.modalView.dismissViewControllerAnimated(true, completion: nil)
    }
}

