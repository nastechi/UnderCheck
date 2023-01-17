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
            
            Text(viewModel.lists[currentListIndex].title)
                .font(Font.custom(K.Fonts.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .foregroundColor(Color(K.Colors.label))
                .offset(y: -15)
        }
    }
    
    private var regularList: some View {
        ZStack {
            Color(K.Colors.background)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            VStack {
                ForEach(viewModel.lists[currentListIndex].items) { item in
                    ListItemView(item: item)
                }
                
            }
            .padding(.top)
        }
    }
    
    private var prosAndConsList: some View {
        Color(K.Colors.label)
            .cornerRadius(20, corners: [.topRight, .topLeft])
        
    }
}

struct SingleListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListView(currentListIndex: 0).environmentObject(ListsViewModel())
    }
}
