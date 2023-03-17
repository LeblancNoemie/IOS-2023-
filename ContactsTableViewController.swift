//
//  ContactsTableViewController.swift
//  PratiqueExamen1
//
//  Created by Noemie Leblanc Lessard on 2023-03-15.
//

import UIKit


//Classe de ma cellule custom: Ne pas oublier d'indiquer que le segue utilise cette classe pour faire les liaisons
class MyContactTableViewCell: UITableViewCell {
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var fullnameLabel2: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

class ContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactDAO.shared.getAllContacts().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Ici on indique que la cellule est une cellule custom: (Voir la classe en haut)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell_Identifier", for: indexPath) as! MyContactTableViewCell

        let contacts : [Contact] = ContactDAO.shared.getAllContacts()
        let contact = contacts[indexPath.row]
        
        cell.fullnameLabel.text = contact.fullname
        cell.phoneLabel.text = contact.phone_number

//        cell.fullnameLabel2.text =  contact.fullname
//        cell.phoneLabel2.text = contact.phone_number
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let idSegue = segue.identifier
//        if idSegue == "showDetailsSegue" {
//            let cellule = sender as? MyContactTableViewCell
//            let index = tableView.indexPath(for: cellule!)?.row
//            let destination = segue.destination as? ContactDetailsViewController
//            let eventTapote = events[index!]
//            destination?.event = eventTapote
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cellule = sender as? MyContactTableViewCell
        let index = tableView.indexPath(for: cellule!)?.row
        let destination = segue.destination as? ContactDetailsViewController
        
        let contacts : [Contact] = ContactDAO.shared.getAllContacts()
        let contact : Contact = contacts[index!]
        destination?.fullname = contact.fullname!
        destination?.myAddress = contact.address!
        destination?.phone = contact.phone_number!
        //self.present(, animated: true)
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

}
