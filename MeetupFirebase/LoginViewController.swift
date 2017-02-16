//
//  LoginViewController.swift
//  MeetupFirebase
//
//  Created by Martin Kuvandzhiev on 2/15/17.
//  Copyright © 2017 Martin Kuvandzhiev. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
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
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let usernameString = self.usernameTextField.text else {return}
        guard let passwordString = self.passwordTextField.text else {return}
        
        FIRAuth.auth()?.signIn(withEmail:
            usernameString, password: passwordString, completion: { (user, error) in
            guard user != nil else {return}
            guard error == nil else {
                
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toMainAppSegue", sender: nil)
            }
        })
    }

}
