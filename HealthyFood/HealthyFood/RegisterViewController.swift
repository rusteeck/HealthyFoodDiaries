//
//  RegisterViewController.swift
//  HealthyFood
//
//  Created by Kirill on 18.03.18.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var labelPleaseEnterYourData: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelResultOfEnter: UILabel!
    
    @IBAction func pushEnterButton(_ sender: Any)
    {
        if textFieldUsername.text == "Username" && textFieldPassword.text == "Password"
        {
            labelResultOfEnter.text = "Выполняется вход в систему"
        }
        
        else
        {
            labelResultOfEnter.text = "Вы ввели неверные данные"
        }
        
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
