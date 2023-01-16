//
//  SingleListView.swift
//  UnderCheck
//
//  Created by Анастасия on 16.01.2023.
//

import SwiftUI

struct SingleListView: View {
    
    @EnvironmentObject private var viewModel: ListsViewModel
    var currentListIndex: Int
    
    var body: some View {
        Text(viewModel.lists[currentListIndex].title)
    }
}

struct SingleListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListView(currentListIndex: 0)
    }
}
