//
//  ViewControllerLogin.swift
//  Alome
//
//  Created by student on 1/6/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewControllerLogin: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {    //exicutes when the login button is pressed
        
        // sets the text in the fields to their variables
        let email = emailText.text
        let password = passwordText.text
        
        //Authenticate and login with firebase
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if let error = error {
                self.errorAlert(errorMessage: error.localizedDescription)   //calls the errorAlert function and presents the error message
            } else {
                self.performSegue(withIdentifier: "toMainPage", sender: nil)    //Segue to the main view controller
            }
        }
    }
        
    func errorAlert(errorMessage:String){   //displays an alert
        
        let alert = UIAlertController(title: "Error", message:errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion:nil)
            // Put code here do do stuff when Ok pressed
        }))
        self.present(alert, animated: true, completion:nil )
    }
    
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

}
