//
//  List.swift
//  UnderCheck
//
//  Created by Анастасия on 15.01.2023.
//

import SwiftUI

struct ListModel: Identifiable, Equatable {
    
    enum ListType {
        case regular
        case checkBox
        case top
        case prosAndCons
    }
    
    let id = UUID()
    let title: String
    let type: ListType
    let image: Image = Image(K.Images.defaultImage)
}
