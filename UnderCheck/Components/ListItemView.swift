//
//  ListItem.swift
//  UnderCheck
//
//  Created by Анастасия on 17.01.2023.
//

import SwiftUI

struct ListItemView: View {
    
    let item: ListItem
    @State var isChecked: Bool?
    
    var body: some View {
        VStack {
            HStack {
                if let place = item.place {
                    Text(String(describing: place) + ".")
                }
                Text(item.name)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if isChecked != nil {
                    Button {
                        item.isChecked!.toggle()
                        isChecked = item.isChecked
                    } label: {
                        if isChecked! {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(K.Colors.accent))
                                .frame(width: 20, height: 20)
                        } else {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(K.Colors.accent))
                                .frame(width: 20, height: 20)
                        }
                    }

                }
            }
            .foregroundColor(Color(K.Colors.label))
            .font(Font.custom(K.Fonts.regular, size: 18))
            .padding(.horizontal)
            Divider()
                .overlay(Color(K.Colors.label))
                .padding(.horizontal)
        }
        .onAppear {
            isChecked = item.isChecked
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: ListItem(name: "Title", isChecked: true))
    }
}
