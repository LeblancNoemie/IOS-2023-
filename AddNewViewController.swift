//
//  AddNewViewController.swift
//  PratiqueExamen1
//
//  Created by Noemie Leblanc Lessard on 2023-03-15.
//

import UIKit

class AddNewViewController: UIViewController {

    @IBOutlet weak var myDataSent: UILabel!
    var myDataValue : String = ""
    
    @IBOutlet weak var fullnameTxtBox: UITextField!
    @IBOutlet weak var addressTxtBox: UITextField!
    @IBOutlet weak var phoneTxtBox: UITextField!
    
    @IBOutlet weak var nullAttributesTxtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //On reçoit les informations du segue précédent:
        myDataSent?.text = "Hello my dear \(myDataValue)"
        
    }

    
    @IBAction func addNewContact(_ sender: Any) {
        if fullnameTxtBox.text == "" || addressTxtBox.text == "" || phoneTxtBox.text == "" {
            nullAttributesTxtLabel.isHidden = false
        } else {
            ContactDAO.shared.addNewContact(fullname: fullnameTxtBox.text!, address: addressTxtBox.text!, phone: phoneTxtBox.text!)
            //self.dismiss(animated: true, completion: nil)
        }
    }
    
//    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
//        print("Attemping to unwind segue")
//    }

//    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
//
//    }

}
