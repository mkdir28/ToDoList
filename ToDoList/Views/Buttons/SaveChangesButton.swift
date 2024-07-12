//
//  SaveChangesButton.swift
//  ToDoList
//
//  Created by Marina on 12.07.2024.
//

import SwiftUI
struct SaveChangesButton: View {
    
    var body: some View {
        Text(Info.EditButton.text)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(10)
    }
}

struct SaveChangesButton_Previews: PreviewProvider{
    static var previews: some View {
        SaveChangesButton()
    }
}
