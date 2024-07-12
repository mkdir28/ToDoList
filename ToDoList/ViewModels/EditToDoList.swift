//
//  EditToDoList.swift
//  ToDoList
//
//  Created by Marina on 12.07.2024.
//

import SwiftUI

struct EditToDoList: View {
    
    @Binding var task: Option
    
//    @StateObject var viewModel = ToDoListViewModel()

    
    @Environment(\.presentationMode) var presentationMode
    
    var onSave: (Option) -> Void
    
    @State private var updatingMode = AddDetailsToDoList()
        
    var body: some View {
        NavigationView {
            VStack {
                AddToDoList(existingTask: task, onCommit: onSave)
                    .navigationTitle(Info.EditButton.text)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(Info.Button.text) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
            }
           
        }
    }
}

