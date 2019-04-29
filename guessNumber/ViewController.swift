//
//  ViewController.swift
//  guessNumber
//
//  Created by wangsc on 2019/4/24.
//  Copyright © 2019 wangsc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var promntLabel: UILabel!
    @IBOutlet weak var chanceLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var surpriseImageView: UIImageView!

    var ansNumber = Int.random(in: 1...100)
    var chance = 6
    
    func check(test: Int) { //設定判斷
        if test > 100 {
            promntLabel.text = "超過範圍囉!"
            chance -= 1
            chanceLabel.text = String("還剩下機會\(chance)次")
        }else if test > ansNumber {
            promntLabel.text = "數字偏大！"
            chance -= 1
            chanceLabel.text = String("還剩下機會\(chance)次")
        }else if test < ansNumber {
            promntLabel.text = "數字偏小！"
            chance -= 1
            chanceLabel.text = String("還剩下機會\(chance)次")
        }else {
            promntLabel.text = "恭喜您猜對了！"
            surpriseImageView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        surpriseImageView.isHidden = true
    }

    @IBAction func ansButton(_ sender: UIButton) {
        inputTextField.resignFirstResponder()//收鍵盤
        
        let ans = Int(inputTextField.text!)
        
        if inputTextField.text == "" {
            promntLabel.text = "你沒有輸入喔"
        }else if chance > 0 {
            check (test: Int(inputTextField.text!)!)
     
        }else if ans == ansNumber {
            promntLabel.text = "您沒機會了，請充值！"
            surpriseImageView.isHidden = false
        }
    }
    
    @IBAction func againButton(_ sender: UIButton) {
        promntLabel.text = "我會告訴你是大還是小"
        chance = 6
        chanceLabel.text = String("還剩下機會\(chance)次")
        surpriseImageView.isHidden = true
        ansNumber = Int.random(in: 1...100)
        inputTextField.clearsOnInsertion = true
      
    }
}

