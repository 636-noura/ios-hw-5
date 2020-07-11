//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

var selectedPlayer = Player(name: "Mario")
class ViewController: UIViewController {
   
    @IBOutlet weak var playerImageview: UIImageView!
    var playerSoundEffect: AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //nextButton.isUserInteractionEnabled = false
     playBackgroundMusic(musicName: "PG.wav")
    }
    
    func playBackgroundMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.play()
        }catch{
            //hello
        }
    }

    func playMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            playerSoundEffect = try AVAudioPlayer(contentsOf: url)
            playerSoundEffect?.play()
        }catch{
            //hello
        }
    }
    
    
    @IBAction func randomplayer(_ sender: Any) {
        let randomPlayer = players.randomElement()!
        playerImageview.image = UIImage(named: randomPlayer.name)
        playMusic(musicName: randomPlayer.musicName())
        selectedPlayer = randomPlayer
    }
    
}

