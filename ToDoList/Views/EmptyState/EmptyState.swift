//
//  EmptyState.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "list.bullet.clipboard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .foregroundColor(Color.infoColor)
                    
                
                Text(Info.EmptyState.noTasks)
                    .font(.setFont(size: 22, weight: .medium))
                    .padding(.init(top: 50, leading: 0, bottom: -10, trailing: 0))
                Text(Info.EmptyState.transcription)
                    .font(.setFont(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

struct EmptyState_Previews: PreviewProvider{
    static var previews: some View{
        EmptyState()
    }
}
