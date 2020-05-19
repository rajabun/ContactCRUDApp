//
//  ViewController.swift
//  ContactCRUDApp
//
//  Created by Muhammad Rajab Priharsanto on 19/05/20.
//  Copyright © 2020 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController
{

    @IBOutlet var contactTableView: UITableView!
    
    var listOfContacts = [ContactDetail]()
    var contactRequest = ContactRequest()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
        self.contactTableView.rowHeight = 100.0
    }


    func fetchData()
    {
        contactRequest.getData
        { [weak self] result in
            switch result
            {
            case .failure(let error):
                print(error)
            case .success(let contacts):
                DispatchQueue.main.async
                {
                    self?.listOfContacts = contacts
                    print("Total Contact List =", self!.listOfContacts.count)
                            
                    self!.contactTableView.delegate = self
                    self!.contactTableView.dataSource = self
                    self!.contactTableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("Table View Rows =", listOfContacts.count)
        return listOfContacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as? ContactTableViewCell
        
        let contact = listOfContacts[indexPath.row]
        
        let urlImage = URL(string: contact.photo)
        
        cell?.contactPhoto.sd_setImage(with: urlImage, completed: nil)
        cell?.firstNameLabel.text = contact.firstName
        cell?.lastNameLabel.text = contact.lastName
        cell?.ageLabel.text = String(contact.age)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

    }
}

