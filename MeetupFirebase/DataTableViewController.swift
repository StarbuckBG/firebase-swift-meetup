//
//  DataTableViewController.swift
//  MeetupFirebase
//
//  Created by Martin Kuvandzhiev on 2/15/17.
//  Copyright © 2017 Martin Kuvandzhiev. All rights reserved.
//

import UIKit
import FirebaseDatabase


class DataTableViewController: UITableViewController {

    
    var data: [String]! = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        FIRDatabase.database().reference(withPath: "data").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let receivedInfo = snapshot.value as! [String:String]
            self.data = [String]()
            for item in receivedInfo{
                self.data.append(item.value)
            }
            
            self.tableView.reloadData()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = self.data[indexPath.row]
        
        return cell
    }
}
