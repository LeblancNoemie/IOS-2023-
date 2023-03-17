//
//  ViewController.swift
//  PratiqueExamen1
//
//  Created by Noemie Leblanc Lessard on 2023-03-15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTxtBox: UITextField!
    
    @IBOutlet weak var welcomeTxtLabel: UILabel!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        let contacts : [Contact] = ContactDataManager.shared.getAllContacts()
        print("There are: \(contacts.count) items in CoreData database")
    }
    
    //Cette partie permet d'envoyer des données à un autre segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddNewViewController {
            let vc = segue.destination as? AddNewViewController
            vc?.myDataValue = name
        }
    }
    
    @IBAction func onConfirmName(_ sender: Any) {
        name = nameTxtBox.text!
        welcomeTxtLabel.text = "Hello \(name) !"
    }
    
}

