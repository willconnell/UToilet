//
//  AudioViewController.swift
//  UToilet
//
//  Created by Max Truty on 10/25/21.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

    
    @IBOutlet weak var playButton: UIButton!
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func playButtonPushed(_ sender: Any) {
        if let player = player, player.isPlaying {
            // stop playback
            
            player.stop()
        } else {
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                
                player.play()
            } catch {
                print("something went wrong")
            }
        }
    }
    
}

