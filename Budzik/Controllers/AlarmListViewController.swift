//
//  ViewController.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/2/21.
//

import UIKit
import CoreData

class AlarmListViewController: UIViewController {
    
    
   static var savedAlarms = [Alarm]()
    var time = String()
 
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        
        
        tableView.hideCells()
        
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let alarmEditVC = AlarmEditTableViewController()
        alarmEditVC.loadAlarms()
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
        
    }
   

}

extension AlarmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if AlarmListViewController.savedAlarms.count == 0 {
            tableView.noAlarmImage(image: UIImage(named: "noAlarm")!)
        }
        return AlarmListViewController.savedAlarms.count
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        
        cell.daysLabel.text = AlarmListViewController.savedAlarms[indexPath.row].days
        
        cell.timeLabel.text = AlarmListViewController.savedAlarms[indexPath.row].date
        
      
        return cell
    }
    
  
    
    
    
    
    
    
}

