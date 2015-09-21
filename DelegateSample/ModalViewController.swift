//
//  ModalViewController.swift
//  DelegateSample
//
//  Created by mzgk on 2015/09/21.
//  Copyright © 2015年 mzgk. All rights reserved.
//

/// 依頼する側
/// 入力した値をParentViewControllerで表示

import UIKit

/// 1.プロトコル定義
protocol ModalViewControllerDelegate {
    /// 2.デリゲートメソッドの定義
    func modalDidFinished(modalText: String)
}

class ModalViewController: UIViewController {

    /// 3.デリゲートインスタンスの定義
    var delegate: ModalViewControllerDelegate?
    @IBOutlet weak var inputField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSubmit(sender: UIButton) {
        /// 4.デリゲートメソッドの呼出し
        self.delegate?.modalDidFinished(inputField.text!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
