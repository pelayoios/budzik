//
//  SoundTableViewCell.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/8/21.
//

import UIKit

protocol SoundListCellDelegate {
    func didPressedPlayBtn(playBtn: UIButton)
}

class SoundTableViewCell: UITableViewCell {
    
    var soundItem: Sounds!
    var delegate: SoundListCellDelegate?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    func setSound(sound: Sounds) {
        soundItem = sound
        name.text = sound.name.replacingOccurrences(of: ".m4a", with: "")
    }
  
    @IBAction func playBtn(_ sender: UIButton) {
        delegate?.didPressedPlayBtn(playBtn: playBtn)
    }
    
}
