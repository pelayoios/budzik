//
//  SoundManager.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/8/21.
//

import Foundation
import AVFoundation

struct SoundManager {
    
    var player: AVAudioPlayer?
    var sound: Sounds?
    
    func currentlyPlaying() -> Sounds? {
        return sound
    }
    
    mutating func play(this sound: Sounds) {
        stop()
        do {
            guard let url = Bundle.main.url(forResource: sound.name, withExtension: ".m4a") else {
                return
            }
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            self.sound = sound
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    mutating func stop() {
        player?.stop()
        self.sound = nil
    }
 }
