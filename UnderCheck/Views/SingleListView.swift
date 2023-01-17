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
    
    @State private var titleTextField: String = ""
    @State private var additionalItemTextField: String = ""
    @State private var secondAdditionalItemTextField: String = ""
    
    var body: some View {
        ZStack {
            Color(K.Colors.background)
                .ignoresSafeArea()
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    headerView
                    
                    switch viewModel.lists[currentListIndex].type {
                    case .prosAndCons:
                        prosAndConsList
                            .offset(y: -40)
                    case .regular, .checkBox, .top:
                        regularList
                            .offset(y: -40)
                    }
                }
                .ignoresSafeArea()
            }
        }
        .onAppear {
            titleTextField = viewModel.lists[currentListIndex].title
        }
        .onTapGesture {
            viewModel.lists[currentListIndex].title = titleTextField
            hideKeyboard()
        }
    }
    
    private var headerView: some View {
            ZStack {
                viewModel.lists[currentListIndex].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350, alignment: .top)
                    .overlay(alignment: .bottom) {
                        titleView
                    }
            }
            .frame(height: 350)
            .ignoresSafeArea()
        
    }
    
    private var titleView: some View {
        ZStack {
            Color(K.Colors.accent)
                .frame(height: 100)
                .opacity(0.1)
                .background(.ultraThinMaterial)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            
            if #available(iOS 16.0, *) {
                TextField("Title", text: $titleTextField, axis: .vertical)
                    .limitInputLength(value: $titleTextField, length: 60)
                    .lineLimit(2)
                    .font(Font.custom(K.Fonts.bold, size: 20))
                    .padding(.horizontal)
                    .foregroundColor(Color(K.Colors.label))
                    .offset(y: -15)
            } else {
                TextField("Title", text: $titleTextField)
                    .limitInputLength(value: $titleTextField, length: 30)
                    .font(Font.custom(K.Fonts.bold, size: 20))
                    .padding(.horizontal)
                    .foregroundColor(Color(K.Colors.label))
                    .offset(y: -15)
            }
        }
    }
    
    private var regularList: some View {
        ZStack {
            Color(K.Colors.background)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            VStack {
                ForEach(viewModel.lists[currentListIndex].items) { item in
                    ListItemView(item: item)
                    
                    Divider()
                        .overlay(Color(K.Colors.label))
                        .padding(.horizontal)
                }
                additionalItem
            }
            .padding(.top)
        }
    }
    
    private var additionalItem: some View {
        VStack {
            HStack {
                if isTop() {
                    if additionalItemTextField == "" {
                        Text(String(describing: viewModel.lists[currentListIndex].items.count + 1) + ".")
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    } else {
                        Text(String(describing: viewModel.lists[currentListIndex].items.count + 1) + ".")
                            .foregroundColor(Color(K.Colors.label))
                    }
                }
                
                if #available(iOS 16.0, *) {
                    TextField("One more thing...", text: $additionalItemTextField, axis: .vertical)
                        .foregroundColor(Color(K.Colors.label))
                } else {
                    TextField("One more thing...", text: $additionalItemTextField)
                        .foregroundColor(Color(K.Colors.label))
                        .limitInputLength(value: $additionalItemTextField, length: 30)
                }
            }
            if additionalItemTextField == "" {
                Divider()
            } else {
                Divider()
                    .overlay(Color(K.Colors.label))
            }
        }
        .font(Font.custom(K.Fonts.regular, size: 18))
        .padding(.horizontal)
    }
    
    private func isTop() -> Bool {
        if viewModel.lists[currentListIndex].type == .top {
            return true
        }
        return false
    }
    
    private var secondAdditionalItem: some View {
        VStack {
            TextField("One more thing...", text: $secondAdditionalItemTextField)
                .foregroundColor(Color(K.Colors.label))
            
            if secondAdditionalItemTextField == "" {
                Divider()
            } else {
                Divider()
                    .overlay(Color(K.Colors.label))
            }
        }
        .font(Font.custom(K.Fonts.regular, size: 18))
        .padding(.horizontal)
    }
    
    private var prosAndConsList: some View {
        VStack {
            headline(title: "Pros")
            ForEach(viewModel.lists[currentListIndex].items) { item in
                if item.prosAndConsType == .pro {
                    ListItemView(item: item)
                    Divider()
                }
            }
            additionalItem
            headline(title: "Cons")
            ForEach(viewModel.lists[currentListIndex].items) { item in
                if item.prosAndConsType == .con {
                    ListItemView(item: item)
                }
            }
            secondAdditionalItem
        }
    }
    
    private func headline(title: String) -> some View {
        ZStack {
            Color(K.Colors.accent)
                .cornerRadius(20)
                .frame(height: 40)
            
            Text(title)
                .font(Font.custom(K.Fonts.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .foregroundColor(Color(K.Colors.background))
        }
    }
}

struct SingleListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListView(currentListIndex: 0).environmentObject(ListsViewModel())
    }
}
