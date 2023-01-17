//
//  ContentView.swift
//  UnderCheck
//
//  Created by Анастасия on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ListsViewModel()
    
    var body: some View {
        NavigationView {
            ListsView()
                .environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
