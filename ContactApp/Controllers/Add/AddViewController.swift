//
//  AddViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

class AddViewController: BaseViewController,AddView {
   
    @IBOutlet weak var nameFild: UITextField!
    @IBOutlet weak var phoneFild: UITextField!
    var hvc = HomeViewController()
    var presenter: AddPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = AddPresenter()
        presenter.addview = self
        presenter.controller = self
        
        // Do any additional setup after loading the view.
    }
    
    func onAddContact(contact: Contact) {
    
    }
    

    @IBAction func saveButton(_ sender: Any) {
        let contact = Contact(name: nameFild.text!,phone: phoneFild.text!)
        presenter.apiContactCreate(contact: contact)
        navigationController?.popViewController(animated: true)
    }

    
}
