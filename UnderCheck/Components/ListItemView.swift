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
    @State var name: String = ""
    
    var body: some View {
        HStack {
            if let place = item.place {
                Text(String(describing: place) + ".")
            }
            textField
            
            if isChecked != nil {
                checkboxButton
            }
        }
        .foregroundColor(Color(K.Colors.label))
        .font(Font.custom(K.Fonts.regular, size: 18))
        .padding(.horizontal)
        .onAppear {
            isChecked = item.isChecked
            name = item.text
        }
    }
    
    private var checkboxButton: some View {
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
    
    private var textField: some View {
        if #available(iOS 16.0, *) {
            return TextField("", text: $name, axis: .vertical)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onDisappear() {
                    item.text = name
                }
        } else {
            return TextField("", text: $name)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onDisappear() {
                    item.text = name
                }
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: ListItem(name: "My list hehe"))
    }
}
