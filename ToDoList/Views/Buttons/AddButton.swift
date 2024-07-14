//
//  AddButton.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI
struct AddButton: View {
    
    var body: some View {
        Text(Info.Button.text)
            .font(.setFont(size: 20,
                           weight: .bold))
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(10)
    }
}

struct AddButton_Previews: PreviewProvider{
    static var previews: some View {
        AddButton()
    }
}
