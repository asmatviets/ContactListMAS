//
//  DataSource.swift
//  ContactListMAS
//
//  Created by Andrey Matviets on 18.04.2023.
//

import UIKit

class DataSource {
    let names = ["Ann", "John", "Bob", "Andrey", "Max"]
    let surnames = ["Wilson", "Hudson", "Allen", "Firstov", "Ahmadov"]
    let phoneNumbers = ["12345678", "21345678", "32145678", "41235678","51234678"]
    let emails = ["abc@mail.com", "bcd@gmail.com", "efg@vtv.ru", "hij@sber.ru", "klm@ingos.ru"]
    
    func getPersons() -> [Person] {
        var randomPersons: [Person] = []
        for _ in 1...10 {
            let person = Person(
                name: names.randomElement() ?? "anonymus",
                surname: surnames.randomElement() ?? "anonymus",
                phoneNumber: phoneNumbers.randomElement() ?? "no data",
                email: emails.randomElement() ?? "no data"
            )
            randomPersons.append(person)
        }
        return randomPersons
    }
}

