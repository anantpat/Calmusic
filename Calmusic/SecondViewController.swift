//
//  SecondViewController.swift
//  Calmusic
//
//  Created by Anant Patni on 04/05/18.
//  Copyright © 2018 Anant & Angad. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var myImageView: UIImageView!

    @IBAction func play(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any)
    {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
        }
    
    
    @IBAction func prev(_ sender: Any) {
        
        if thisSong != 0 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs[thisSong]
 
        }
        else
        {
            
        }

        
    }
    
    
    @IBAction func next(_ sender: Any) {
        if thisSong < songs.count - 1 && audioStuffed == true
        {
        playThis(thisOne: songs[thisSong+1])
            thisSong += 1
            label.text = songs[thisSong]

        }
        else
        {
            
        }
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
       if audioStuffed == true
       {
        audioPlayer.volume = sender.value

        }

    }
    
    func playThis(thisOne: String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
        }
        catch
        {
            print("ERROR")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs[thisSong]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

