//
//  ContactDetailsViewController.swift
//  ContactListMAS
//
//  Created by Andrey Matviets on 18.04.2023.
//

import UIKit

class ContactDetailsViewController: UIViewController {


    @IBOutlet var fullName: UILabel!
    @IBOutlet var number: UILabel!
    @IBOutlet var mailAdress: UILabel!
    
    var contact: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.text = contact.fullName
        number.text = contact.phoneNumber
        mailAdress.text = contact.email
    }
}
