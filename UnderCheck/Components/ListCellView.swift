//
//  ListCellView.swift
//  UnderCheck
//
//  Created by Анастасия on 17.01.2023.
//

import SwiftUI

struct ListCellView: View {
    
    let title: String
    
    var body: some View {
        ZStack {
            Color(K.Colors.background)
                .frame(height: 50)
            
            VStack {
                HStack {
                    Text(title)
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

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(title: "Hello")
    }
}
