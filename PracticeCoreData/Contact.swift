

import Foundation
import UIKit
import CoreData

class Contact: Codable {
    
    private static var persistentContext: NSManagedObjectContext {
        get {
            let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
            let context = persistentContainer.viewContext
            return context
        }
    }
    
    var name: String
    var eMail: String
    var number: String
    
    init(name: String, number: String, eMail: String) {
        self.name = name
        self.number = number
        self.eMail = eMail
    }
    
    func save() {
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: Contact.persistentContext)!
        let newContact = NSManagedObject(entity: entity, insertInto: Contact.persistentContext)
        
        newContact.setValue(name, forKey: "name")
        newContact.setValue(number, forKey: "number")
        newContact.setValue(eMail, forKey: "eMail")
        
        do {
            try Contact.persistentContext.save()
        } catch {
            print("Failed saving")
        }
    }
    
    static func getContacts() -> [Contact] {
        var contacts = [Contact]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        
        do {
            let result = try persistentContext.fetch(fetchRequest)
            for contact in result as! [NSManagedObject] {
                let name = contact.value(forKey: "name") as! String
                let number = contact.value(forKey: "number") as! String
                let eMail = contact.value(forKey: "eMail") as! String
                let contact = Contact(name: name, number: number, eMail: eMail)
                contacts.append(contact)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return contacts
    }
    
}
