//
//  HomeView.swift
//  ContactApp
//
//  Created by A'zamjon Abdumuxtorov on 26/02/24.
//

import Foundation

protocol HomeView{
    func onLoadContacts(contact:[Contact])
    func onContactDelete(deleted:Bool)
}
