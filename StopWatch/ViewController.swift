//
//  ViewController.swift
//  StopWatch
//
//  Created by D7703_21 on 2018. 4. 12..
//  Copyright © 2018년 D7703_21. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Stop: UIButton!
    @IBOutlet weak var Reset: UIButton!
    
    var count = 0
    var myTimer = Timer()
    
    // 여러번 못누르게 만드는 함수선언
    func changeButoonState(start: Bool, stop: Bool, reset: Bool) {
        Start.isEnabled = start
        Stop.isEnabled = stop
        Reset.isEnabled = reset
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    @IBAction func Start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
        
        // 누르면 스타트만 버튼이 꺼지게한다.
        changeButoonState(start: false, stop: true, reset: true)
    }

    
    @IBAction func Stop(_ sender: Any) {
        myTimer.invalidate()
        
        // 누르면 스탑만 버튼이 꺼지게한다.
        changeButoonState(start: true, stop: false, reset: true)
    }
    
    
    @IBAction func Reset(_ sender: Any) {
        timeLabel.text = "00:00:00"
        count=0
        
        // 누르면 리셋만 버튼이 꺼지게한다.
        changeButoonState(start: true, stop: true, reset: false)
    }
 
}

