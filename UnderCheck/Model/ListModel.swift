//
//  List.swift
//  UnderCheck
//
//  Created by Анастасия on 15.01.2023.
//

import SwiftUI

struct ListModel: Identifiable, Equatable {
    
    static func == (lhs: ListModel, rhs: ListModel) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        return false
    }
    
    enum ListType {
        case regular
        case checkBox
        case top
        case prosAndCons
    }
    
    let id = UUID()
    var title: String
    let type: ListType
    let image: Image = Image(K.Images.defaultImage)
    var items: [ListItem] = []
}

class ListItem: Identifiable {
    
    enum prosAndConsType {
        case pro
        case con
    }
    
    init(name: String, isChecked: Bool? = nil, place: Int? = nil, prosAndConsType: prosAndConsType? = nil) {
        self.text = name
        self.isChecked = isChecked
        self.place = place
        self.prosAndConsType = prosAndConsType
    }
    
    let id = UUID()
    var text: String
    var isChecked: Bool?
    var place: Int?
    var prosAndConsType: prosAndConsType?
}
