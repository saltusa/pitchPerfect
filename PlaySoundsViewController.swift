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
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
        //set audio output to speaker
        var session = AVAudioSession.sharedInstance()
        let speaker = AVAudioSessionPortOverride.Speaker
        session.overrideOutputAudioPort(speaker, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stopAllSound() {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    @IBAction func stopPlaySound(sender: UIButton) {
        //stop play sound
        println("stop all audio")
        stopAllSound()
    }
    
    @IBAction func playFastSound(sender: UIButton) {
        
        stopAllSound()
        //play fast sound
        println("play fast sound")
        
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
    }

    @IBAction func playSlowSound(sender: UIButton) {
        stopAllSound()
        // play slow sound
        println("play slow sound")

        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    @IBAction func playChipmunkSound(sender: UIButton) {
        stopAllSound()
        // play chipmunk sound
        println("play chipmunk sound")
        playAudioWithVariablePitch( 1000 )
        
    }
    
    @IBAction func playDarthVaderSound(sender: UIButton) {
        stopAllSound()
        
        //play darthVader Sound
        println("play Darthvader Sound")
        playAudioWithVariablePitch(-1000)
    }
    func playAudioWithVariablePitch(pitch: Float){
        
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
       
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
