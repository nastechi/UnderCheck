//
//  ListsViewModel.swift
//  UnderCheck
//
//  Created by Анастасия on 16.01.2023.
//

import Foundation

@MainActor
class ListsViewModel: ObservableObject {
    @Published var lists: [ListModel] = [ListModel(title: "list one", type: .regular, items: [ListItem(name: "regular item"), ListItem(name: "item two"), ListItem(name: "item three")]), ListModel(title: "list two is very very long, it is certainly lonjer than just one line", type: .top, items: [ListItem(name: "number one item", place: 1), ListItem(name: "number two item", place: 2)]), ListModel(title: "list three", type: .checkBox, items: [ListItem(name: "unchecked item", isChecked: false), ListItem(name: "checked item", isChecked: true)]), ListModel(title: "list four", type: .prosAndCons, items: [ListItem(name: "pro item", prosAndConsType: .pro), ListItem(name: "con item", prosAndConsType: .con), ListItem(name: "second pro item", prosAndConsType: .pro)]), ListModel(title: "empty list", type: .regular)]
}
