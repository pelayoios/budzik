//
//  AlarmEditTableViewController.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/2/21.
//

import UIKit
import CoreData

class AlarmEditTableViewController: UITableViewController {
    
    @IBOutlet weak var repeatDaysLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmTitleText: UITextField!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var snoozeSwitch: UISwitch!
    
    
    @IBOutlet var repeatDaysBtnArray: [UIButton]!
    
    var repeatDays  = [Int: String]()
    let days = [1: "Mon", 2: "Tue", 3: "Wed", 4: "Thu", 5: "Fri", 6: "Sat", 7: "Sun"]
    let weekend = [6: "Sat", 7: "Sun"]
    let weekday = [1: "Mon", 2: "Tue", 3: "Wed", 4: "Thu", 5: "Fri"]
    
   var alarmListVC = AlarmListViewController()
    var alarm = Alarm()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        datePicker.datePickerMode = .time
        
        loadAlarms()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }


    @IBAction func repeatBtnPressed(_ sender: UIButton) {
        repeatDaysLabel.text = ""
        sender.isSelected = !sender.isSelected
        
        for sender in repeatDaysBtnArray {
            sender.setBackgroundImage(UIImage(named: "fill-circle"), for: .selected)
            sender.setTitleColor(UIColor.white, for: .selected)
        }
        if let day = days[sender.tag] {
            if day == repeatDays[sender.tag] {
                repeatDays.removeValue(forKey: sender.tag)
            }else {
                repeatDays[sender.tag] = day
            }
        }
        changeRepeatDaysLabel(dictionary: repeatDays, label: repeatDaysLabel)
        
    }
    
   
    @IBAction func snoozeBtnChanged(_ sender: UISwitch) {
    }
    

    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        let registrationView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alarmyListVC") as! AlarmListViewController
       
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short

        let strDate = timeFormatter.string(from: datePicker.date)
        

        let newAlarm = Alarm(context: self.context)
        newAlarm.date = strDate
        newAlarm.days = repeatDaysLabel.text
        AlarmListViewController.savedAlarms.append(newAlarm)
        
        self.saveAlarms()
        
       
        
        navigationController?.pushViewController(registrationView, animated: true)
        
    }
    
  
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
    }
    
}

extension AlarmEditTableViewController {
    
    func changeRepeatDaysLabel(dictionary: Dictionary<Int, String>, label: UILabel) {
        for key in dictionary.keys.sorted() {
            label.text! += dictionary[key]! + " "
        }
        if dictionary == weekday {
            label.text = "Weekdays"
        }
        if dictionary == weekend {
            label.text = "Weekends"
        }
        if dictionary.count == 7 {
            label.text = "Every day"
        }
        if dictionary.isEmpty {
            label.text = "None"
        }
    }
    
    func saveAlarms() {
        
        do {
            try context.save()
        }catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadAlarms() {
        
        let request: NSFetchRequest<Alarm> = Alarm.fetchRequest()
        do {
            AlarmListViewController.savedAlarms =  try context.fetch(request)
        }catch {
            print("Error loading context \(error)")
        }
        
        
    }
}
