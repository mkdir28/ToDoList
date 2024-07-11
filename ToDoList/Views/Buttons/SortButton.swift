//
//  SortButton.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI
struct SortButton: View {
    
    var body: some View {
        Image(systemName: "line.3.horizontal.decrease.circle.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundColor(Color.infoColor)
    }
}

struct SortButton_Previews: PreviewProvider{
    static var previews: some View {
        SortButton()
    }
}
