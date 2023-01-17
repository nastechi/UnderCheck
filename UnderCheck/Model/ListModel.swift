//
//  List.swift
//  UnderCheck
//
//  Created by Анастасия on 15.01.2023.
//

import SwiftUI

class ListModel: Identifiable, Equatable {
    
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
    
    init(title: String, type: ListType, image: Image = Image(K.Images.defaultImage), items: [ListItem] = []) {
        self.title = title
        self.type = type
        self.image = image
        self.items = items
    }
    
    let id = UUID()
    let title: String
    let type: ListType
    let image: Image
    var items: [ListItem]
}

class ListItem: Identifiable {
    
    enum prosAndConsType {
        case pro
        case con
    }
    
    init(name: String, isChecked: Bool? = nil, place: Int? = nil, prosAndConsType: prosAndConsType? = nil) {
        self.name = name
        self.isChecked = isChecked
        self.place = place
        self.prosAndConsType = prosAndConsType
    }
    
    let id = UUID()
    var name: String
    var isChecked: Bool?
    var place: Int?
    var prosAndConsType: prosAndConsType?
}
