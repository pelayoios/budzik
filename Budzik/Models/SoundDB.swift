//
//  SoundDB.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/8/21.
//

import Foundation


struct SoundDB {
    var sounds = [Sounds]()
    var count: Int {
        get {
            return sounds.count
        }
    }
    
    init() {
        sounds = [
        
            Sounds(id: 1, name: "New-beginning", duration: 35),
            Sounds(id: 2, name: "Ukelele", duration: 36),
            Sounds(id: 3, name: "Creative", duration: 37),
            Sounds(id: 4, name: "Little", duration: 35)
        
        
        
        
        ]
    }
    
    func getSound(position: Int) -> Sounds? {
        guard 0...(sounds.count - 1) ~=  position else {
            return nil
        }
        return sounds[position]
    }
    
    func getPosition(_ sound: Sounds) -> Int? {
        return sounds.firstIndex { $0 == sound}
    }
}
