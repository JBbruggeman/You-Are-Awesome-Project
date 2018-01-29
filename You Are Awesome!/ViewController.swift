//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by JB Bruggeman on 1/22/18.
//  Copyright © 2018 JB Bruggeman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    let numberOfImages = 10
    var soundNumber = -1
    let numberOfSounds = 3
    var soundName = ""
    
    
    //Code below executes at load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(soundName: String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer (data: sound.data)
                awesomePlayer.play()
            } catch {
                print("Error \(soundName) couldn't be played")
            }
        } else {
            print("Error: File \(soundName) didn't load")
        }
    }
    
    func nonRepeatingNumber(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You Brighten My Day!",
                        "I can't wait to use your app!",
                        "You are da bomb!"]
        
        //Messages
        index = nonRepeatingNumber(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //Images
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingNumber(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        //Sounds
        soundNumber = nonRepeatingNumber(lastNumber: soundNumber, maxValue: numberOfSounds)
        
        let soundName = "sound\(soundNumber)"
        playSound(soundName: soundName)
    
   
        
        
        //var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
        //messageLabel.text = messages[randomIndex]

        /*
        messageLabel.text = messages[index]
        index = index + 1
        
        if index == messages.count {
            index = 0
        }
        
    
//        let message1 = "You Are Da Bomb!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        } else if messageLabel.text == message2 {
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
//
//        }
        */
    }

}
