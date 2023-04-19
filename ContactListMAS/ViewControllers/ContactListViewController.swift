//
//  ContactListViewController.swift
//  ContactListMAS
//
//  Created by Andrey Matviets on 18.04.2023.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    var contacts = DataSource().getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 40
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactDetailsVC = segue.destination as? ContactDetailsViewController
        contactDetailsVC?.contact = sender as? Person
    }
}

    // MARK: - UITableViewDataSource
    extension ContactListViewController {
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacts.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
            var content = cell.defaultContentConfiguration()
            let contact = contacts[indexPath.row]
            content.text = contact.fullName
            cell.contentConfiguration = content
            return cell
        }

    }
    // MARK: - UITableViewDelegate

extension ContactListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        performSegue(withIdentifier: "ContactDetailsViewController", sender: contact)
    }
}
