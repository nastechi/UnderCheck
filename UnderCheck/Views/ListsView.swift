//
//  ListsView.swift
//  UnderCheck
//
//  Created by Анастасия on 16.01.2023.
//

import SwiftUI

struct ListsView: View {
    
    @EnvironmentObject private var viewModel: ListsViewModel
    @State var settingsPresented = false
    
    var body: some View {
        ZStack{
            Color(K.Colors.background)
                .ignoresSafeArea()
            ScrollView(.vertical) {
                settingsButton
                addButton
                listsView
            }
            .sheet(isPresented: $settingsPresented) {
                SettingsView()
            }
        }
    }
    
    private var settingsButton: some View {
        Button {
            settingsPresented = true
        } label: {
            Image(systemName: "gear")
                .foregroundColor(Color(K.Colors.label))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
        }
    }
    
    private var addButton: some View {
        NavigationLink {
            AddListView()
        } label: {
            ZStack {
                Color(K.Colors.accent)
                    .frame(height: 100)
                    .cornerRadius(20, corners: [.topRight, .topLeft])
                HStack {
                    Text("Add list")
                        .font(Font.custom(K.Fonts.regular, size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(Color(K.Colors.background))
                    
                    Image(systemName: "plus")
                        .padding(.horizontal)
                        .foregroundColor(Color(K.Colors.background))
                }
                .offset(y: -20)
            }
            .overlay(alignment: .bottom) {
                Color(K.Colors.background)
                    .frame(height: 40)
                    .cornerRadius(20, corners: [.topRight, .topLeft])
            }
            .padding(.top)
        }
    }
    
    private var listsView: some View {
        VStack {
            ForEach(viewModel.lists) { list in
                listCellView(list: list)
            }
            .offset(y: -30)
            Spacer()
        }
    }
    
    private func listCellView(list: ListModel) -> some View {
        NavigationLink {
            if let index = viewModel.lists.firstIndex(of: list) {
                SingleListView(currentListIndex: index)
                    .environmentObject(viewModel)
            }
        } label: {
            ZStack {
                Color(K.Colors.background)
                    .frame(height: 50)
                
                VStack {
                    HStack {
                        Text(list.title)
                            .foregroundColor(Color(K.Colors.label))
                            .font(Font.custom(K.Fonts.regular, size: 18))
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(K.Colors.accent))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Divider()
                        .overlay(Color(K.Colors.label))
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView().environmentObject(ListsViewModel())
    }
}
