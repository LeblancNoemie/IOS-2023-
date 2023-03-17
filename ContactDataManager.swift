//
//  ContactDataManager.swift
//  PratiqueExamen1
//
//  Created by Noemie Leblanc Lessard on 2023-03-15.
//

import Foundation
import CoreData

class ContactDataManager{
    
    static var shared = ContactDataManager()
    
    init(){
        //initContacts()
    }
    

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PratiqueExamen1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func initContacts(){
        let context = persistentContainer.viewContext
        
        let c1 = Contact(context: context)
        c1.fullname = "Patricia Hawthorne"
        c1.address = "3733 Camden Street"
        c1.phone_number = "512-550-4430"
        
        let c2 = Contact(context: context)
        c2.fullname = "Hellen Lassiter"
        c2.address = "3331 Bubby Drive"
        c2.phone_number = "775-284-0437"
        
        let c3 = Contact(context: context)
        c3.fullname = "James Guinan"
        c3.address = "4108 Patterson Fork Road"
        c3.phone_number = "773-559-0606"
        
        do {
            try context.save()
        }catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func addNewContact(name: String, addr: String, phon: String){
        let context = persistentContainer.viewContext
        let contact = Contact(context: context)
        contact.fullname = name
        contact.address =  addr
        contact.phone_number = phon
        do{
            try context.save()
        }catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func getAllContacts() -> [Contact]{
        let context = persistentContainer.viewContext
        let request : NSFetchRequest<Contact> = Contact.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}
