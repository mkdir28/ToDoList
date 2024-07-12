//
//  EditToDoList.swift
//  ToDoList
//
//  Created by Marina on 12.07.2024.
//

import SwiftUI

struct EditToDoList: View {
    
    @Binding var task: Option
        
    var body: some View {
        NavigationView {
            VStack {
                TextField(Info.EditButton.text, text: $task.taskName)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Button(action: {}) {
                                SaveChangesButton()
                                    .padding(.bottom, 50)
                            }
                        }
                    }
            }
            .navigationTitle(Info.Logo.logoText)
            
        }
    }
}
