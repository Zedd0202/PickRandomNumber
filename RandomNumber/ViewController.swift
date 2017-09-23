//
//  ViewController.swift
//  RandomNumber
//
//  Created by Zedd on 2017. 9. 23..
//  Copyright © 2017년 Zedd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var pickButton: UIButton!
    var timer: Timer?
    var arr = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.layer.zPosition = 1
        pickButton.addTarget(self, action: #selector(pickButtonAction), for: .touchUpInside)
    }
    
    func isContain(_ num : Int)->Bool{
        if arr.contains(num){
            return false
        }
        else{
            return true
        }
    }
    
    func returnRandomNum()->Int{
        return Int(arc4random_uniform(245)) + 1
    }

    func pickButtonAction() {
        self.pickButton.isEnabled = false
        while(true){
            let random = returnRandomNum()
            if !isContain(random){
                continue
            } else{
                arr.append(random)
                var time:Double = 3
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (second) in
                    
                    
                    self.numberLabel.textColor = .black
                    self.numberLabel.text = String(Int(time))
                    self.numberLabel.font = UIFont.systemFont(ofSize: 100, weight: 0.3)
                    
                    if time == 0 {
                        second.invalidate()
                        self.timer = nil
                        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                            self.numberLabel.frame.origin.y += 20
                        })
                        self.pickButton.isEnabled = true
                        
                        self.numberLabel.font = UIFont.systemFont(ofSize: 120)
                        self.numberLabel.textColor = UIColor(red: 120/255, green: 200/255, blue: 230/255, alpha: 1)
                        self.numberLabel.text = String(random)
                    } else {
                        self.numberLabel.layer.removeAllAnimations()
                        time -= Double(second.timeInterval)
                    }
                })
                break
            }
        }

    }

}

