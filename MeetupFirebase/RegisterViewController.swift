//
//  RegisterViewController.swift
//  MeetupFirebase
//
//  Created by Martin Kuvandzhiev on 2/15/17.
//  Copyright © 2017 Martin Kuvandzhiev. All rights reserved.
//

import UIKit
import FirebaseAuth


class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
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
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let usernameString = self.emailTextField.text else {return}
        guard let passwordString = self.passwordTextField.text else {return}
        
        FIRAuth.auth()?.createUser(withEmail: usernameString, password: passwordString, completion: { (user, error) in
            guard error == nil else {
                return
            }
            
            guard user != nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "userRegisteredSegue", sender: nil)
            }
            
        })
    }

}
