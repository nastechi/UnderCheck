//
//  ListsViewModel.swift
//  UnderCheck
//
//  Created by Анастасия on 16.01.2023.
//

import Foundation

@MainActor
class ListsViewModel: ObservableObject {
    @Published var lists: [ListModel] = [ListModel(title: "list one", type: .checkBox), ListModel(title: "list two", type: .regular), ListModel(title: "list three", type: .regular), ListModel(title: "list four", type: .regular), ListModel(title: "list five", type: .regular)]
}
