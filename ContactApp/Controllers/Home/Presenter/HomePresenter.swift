//
//  HomePresenter.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 26/02/24.
//

import Foundation

protocol HomePresenterProtocol{
    func apiContactList()
    func apiContactDelete(contact:Contact)
}


class HomePresenter:HomePresenterProtocol{
    
    
    var homeview:HomeView!
    var controller: BaseViewController!
    
    func apiContactList(){
        controller.showProgres()
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: {respons in
            self.controller.hideProgres()
            switch respons.result{
            case .success:
                let contact = try! JSONDecoder().decode([Contact].self, from: respons.data!)
                self.homeview.onLoadContacts(contact: contact)
            case let .failure(error):
                print(error)
                self.homeview.onLoadContacts(contact: [Contact]())
            }
        })
    }
    
    func apiContactDelete(contact:Contact){
        controller.showProgres()
        AFHttp.del(url: AFHttp.API_POST_DELETE + contact.id!, params: AFHttp.paramsEmpty(), handler: {respons in
            self.controller.hideProgres()
            switch respons.result{
            case .success:
                print(respons.result)
                self.homeview.onContactDelete(deleted: true)
            case let .failure(error):
                print(error)
                self.homeview.onContactDelete(deleted: false)
            }
        })
    }
    
}
