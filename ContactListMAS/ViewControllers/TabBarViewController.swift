//
//  TabBarViewController.swift
//  ContactListMAS
//
//  Created by Andrey Matviets on 19.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let contacts = DataSource().getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contacts)

    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let navigationVC = viewController as? UINavigationController {
                let topViewController = navigationVC.topViewController
                if let contactListVC = topViewController as? ContactListViewController {
                    contactListVC.contacts = contacts
                } else if let contactSectionsVC = topViewController as? ContactListSectionsViewController {
                    contactSectionsVC.contacts = contacts
                }
            }
        }
    }
}
