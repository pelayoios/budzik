//
//  SoundListTableViewController.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/5/21.
//

import UIKit

class SoundListTableViewController: UITableViewController {
    
    var sounds = SoundDB()
    var soundManager = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        soundManager.stop()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "SoundTableViewCell", bundle: nil), forCellReuseIdentifier: "soundCell")
        tableView.hideCells()
    }
    
    func getViewIndexInTableView(tableView: UITableView, view: UIView) -> IndexPath? {
        let position = view.convert(CGPoint.zero, to: tableView)
        
        return tableView.indexPathForRow(at: position)
    }
    func changeButtonImage(for button: UIButton, play: Bool) {
        UIView.transition(with: button,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                            button.setImage(UIImage(systemName: play ? "play.circle.fill" : "stop.fill"), for: .normal)
                            
        }, completion: nil)
    }
    
    func stopCurrentlyPlayingSound() {
        if let currentSound = soundManager.currentlyPlaying() {
            soundManager.stop()
            if let indexStop = sounds.getPosition(currentSound) {
                let cell = tableView.cellForRow(at: IndexPath(item: indexStop, section: 0)) as! SoundTableViewCell
                changeButtonImage(for: cell.playBtn, play: true)
            }
        }
    }
    
   
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sound = sounds.getSound(position: indexPath.row)!
        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCell", for: indexPath) as! SoundTableViewCell
        cell.delegate = self
        cell.setSound(sound: sound)
        
        return cell
    }

}

extension SoundListTableViewController: SoundListCellDelegate {
    func didPressedPlayBtn(playBtn: UIButton) {
        if let index = getViewIndexInTableView(tableView: tableView, view: playBtn),
           let sound = sounds.getSound(position: index.row) {
            
            guard sound != soundManager.currentlyPlaying() else {
                stopCurrentlyPlayingSound()
                
                return
            }
            // Stop any sound that is playing
            stopCurrentlyPlayingSound()
            // Start playing the new sound
            soundManager.play(this: sound)
            changeButtonImage(for: playBtn, play: false)
        }
    }
    
    
}
