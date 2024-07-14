//
//  GetStartedButton.swift
//  ToDoList
//
//  Created by Marina on 14.07.2024.
//

import SwiftUI
struct GetStartedButton: View {
    
    var body: some View {
        Text(Info.Button.start)
            .font(.setFont(size: 16,
                           weight: .bold))
            .fontWeight(.semibold)
            .frame(width: 200, height: 35)
            .foregroundColor(Color.orange)
            .background(Color.black)
            .cornerRadius(10)
    }
}

struct GetStartedButton_Previews: PreviewProvider{
    static var previews: some View {
        GetStartedButton()
    }
}

