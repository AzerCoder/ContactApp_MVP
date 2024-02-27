//
//  AddPresenter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 26/02/24.
//

import Foundation

protocol AddPresenterProtocol{
    func apiContactCreate(contact:Contact)
}

class AddPresenter:AddPresenterProtocol{
    var addview:AddView!
    var controller: BaseViewController!
    
    func apiContactCreate(contact: Contact){
        controller.showProgres()
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(contact: contact), handler: {respons in
            self.controller.hideProgres()
            switch respons.result{
            case .success:
                print(respons.result)
                self.addview.onAddContact(contact: contact)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    
}
