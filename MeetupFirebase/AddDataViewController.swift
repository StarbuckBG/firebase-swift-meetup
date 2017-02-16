//
//  AddDataViewController.swift
//  MeetupFirebase
//
//  Created by Martin Kuvandzhiev on 2/15/17.
//  Copyright © 2017 Martin Kuvandzhiev. All rights reserved.
//

import UIKit

import FirebaseDatabase

class AddDataViewController: UIViewController {
    @IBOutlet weak var data1TextField: UITextField!

    @IBOutlet weak var data2TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addButtonTapped(_ sender: UIButton) {
        let reference = FIRDatabase.database().reference(withPath: "data")
        reference.childByAutoId().setValue(data1TextField.text)
    }
}
