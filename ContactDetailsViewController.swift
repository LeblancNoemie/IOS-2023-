//
//  ContactDetailsViewController.swift
//  PratiqueExamen1
//
//  Created by Noemie Leblanc Lessard on 2023-03-15.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var fullname : String = ""
    var phone : String = ""
    var myAddress : String = ""
    
    //    @IBOutlet weak var ContactInfos: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        fullnameLabel.text = fullname
        addressLabel.text = myAddress
        phoneLabel.text = phone
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
