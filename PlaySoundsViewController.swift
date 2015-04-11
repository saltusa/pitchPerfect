//
//  PlaySoundsViewController.swift
//  Yan pitch perfect
//
//  Created by 彦 曲 on 4/9/15.
//  Copyright (c) 2015 Q software. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
//            var filePathUrl = NSURL.fileURLWithPath(filePath)
//
//        } else {
//            println("file is empty")
//        }
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopPlaySound(sender: UIButton) {
        //stop play sound
        println("stop all audio")
        audioPlayer.stop()
    }
    
    @IBAction func playFastSound(sender: UIButton) {
        //play fast sound
        println("play fast sound")
        
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
    }

    @IBAction func playSlowSound(sender: UIButton) {
        
        // play slow sound
        println("play slow sound")

        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
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
