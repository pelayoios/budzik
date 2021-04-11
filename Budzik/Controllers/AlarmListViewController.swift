//
//  ViewController.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/2/21.
//

import UIKit

class AlarmListViewController: UIViewController {
    
    var savedAlarms = [String]()
    var time = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
       //savedAlarms = ["Alarma 1", "Alarma 2"]
        
        tableView.hideCells()
        
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
     
    }


}

extension AlarmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if savedAlarms.count == 0 {
            tableView.noAlarmImage(image: UIImage(named: "noAlarm")!)
        }
            return savedAlarms.count
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        
        cell.daysLabel.text = savedAlarms[indexPath.row]
        
        cell.timeLabel.text = time 
        
        return cell
    }
}

