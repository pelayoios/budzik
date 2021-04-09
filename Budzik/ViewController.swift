//
//  ViewController.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/2/21.
//

import UIKit

class AlarmListViewController: UIViewController {
    
    var savedAlarms = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        savedAlarms = ["Alarma 1", "Alarma 2"]
    }


}

extension AlarmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if savedAlarms.count == 0 {
            self.tableView.show
        }
        return savedAlarms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell")!
        
        cell.textLabel?.text = savedAlarms[indexPath.row]
        
        return cell
    }
}

