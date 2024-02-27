//
//  EditPresenter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 26/02/24.
//

import Foundation

protocol EditPresenterProtocol{
    func apiContactUpdate(contact:Contact)
}

class EditPresenter:EditPresenterProtocol{
    var editview: EditView!
    var controller: BaseViewController!
    
    func apiContactUpdate(contact: Contact){
        controller.showProgres()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + contact.id!, params: AFHttp.paramsPostUpdate(contact: contact), handler: {respons in
            self.controller.hideProgres()
            switch respons.result{
            case .success:
                print(respons.result)
                self.editview.onContactUpdate(contact: contact)
            case let .failure(error):
                print(error)
            }
        })
        
    }
}
