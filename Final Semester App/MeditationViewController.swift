//
//  MeditationViewController.swift
//  Final Semester App
//
//  Created by Calen A Benson (Student) on 12/16/21.
//

import UIKit

class MeditationViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timeCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startAction(_ sender: UIButton) {
        if (timeCounting) {
            timeCounting = false
            timer.invalidate()
            startButton.setTitle("Pause", for: .normal)
        }
        else{
            timeCounting = true
            startButton.setTitle("Start", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCounter) , userInfo: nil , repeats: true)
        }
        }
    @objc func timerCounter() -> Void
    {
    count = count + 1
        let time = secondsToMinutes(seconds: count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        timerLabel.text = timeString
        
    }
    func secondsToMinutes (seconds: Int) -> (Int, Int)
    {
        return ((seconds / 3600), (seconds % 3600 / 60))
    }
    func makeTimeString (minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    @IBAction func resetAction(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Meditation?", message: "Are you sure you would like to reset meditation session?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            //do nothing
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [self] (_) in
            self.count = 0
            self.timer.invalidate()
            self.timerLabel.text = self.makeTimeString(minutes: 0, seconds: 0)
            self.startButton.setTitle("Start", for: .normal)
        }))
        self.present(alert, animated:true, completion:nil)
    }
    
    }




