//
//  EditViewController.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

class EditViewController: BaseViewController,EditView {
  
    
    @IBOutlet weak var nameLb: UITextField!
    @IBOutlet weak var phoneLb: UITextField!
    var contact: Contact?
    var hvc = HomeViewController()
    var presenter: EditPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contact {
            nameLb.text = contact.name
            phoneLb.text = contact.phone
        }
        presenter = EditPresenter()
        presenter.editview = self
        presenter.controller = self
    }
    
    func onContactUpdate(contact: Contact) {
        
    }
    
    @IBAction func UpdateButton(_ sender: Any) {
        guard let newName = nameLb.text, let newPhone = phoneLb.text else {
            return
        }
        
        if var contact = contact {
            contact.name = newName
            contact.phone = newPhone
            presenter.apiContactUpdate(contact: contact)
        }
        
        dismiss(animated: true,completion: nil)
    }
}

