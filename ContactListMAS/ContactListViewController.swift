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
        navigationItem.largeTitleDisplayMode = .automatic
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

