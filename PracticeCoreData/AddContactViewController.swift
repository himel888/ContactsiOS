//
//  AddContactViewController.swift
//  PracticeCoreData
//
//  Created by Mr. Hasan on 10/2/18.
//  Copyright © 2018 kazi. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtNumber: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSaveContactAction(_ sender: UIButton) {
        
        guard let name = txtName.text, !name.isEmpty else {
            showAlert(with: "Name is Empty")
            return
        }
        
        guard let email = txtEmail.text, !email.isEmpty else {
            showAlert(with: "Email is Empty")
            return
        }
        
        guard let number = txtNumber.text, !number.isEmpty else {
            showAlert(with: "Number is Empty")
            return
        }
        
        let contact = Contact(name: name, number: number, eMail: email)
        contact.save()
        navigationController?.popViewController(animated: true)
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "Add Contact", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}
