//
//  ContactDAC.swift
//  PratiqueExamen1
//
//  Created by Noemie Leblanc Lessard on 2023-03-15.
//

import Foundation
class ContactDAO {
    static var shared = ContactDAO()
    
    func getAllContacts() -> [Contact] {
        return ContactDataManager.shared.getAllContacts()
    }
    
    func addNewContact(fullname: String, address : String, phone : String){
        ContactDataManager.shared.addNewContact(name: fullname, addr: address, phon: phone)
    }
}
