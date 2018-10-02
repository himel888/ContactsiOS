//
//  ViewController.swift
//  PracticeCoreData
//
//  Created by Mr. Hasan on 10/2/18.
//  Copyright © 2018 slickdevs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact]! {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        contacts = Contact.getContacts()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConatctTableViewCell
        let contact = contacts[indexPath.row]
        
        cell.name.text = contact.name
        cell.eMail.text = contact.eMail
        cell.number.text = contact.number
        
        return cell
    }
    
    
}

