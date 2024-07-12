//
//  ContentView.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    
    @State private var editing = false
    
    @State private var addTask = false
    
    private func presentAddReminderView() {
        addTask.toggle()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isEmpty {
                    EmptyState()
                } else {
                    SortingPreview()
                    List {
                        ForEach($viewModel.tasks) { $task in
                            HStack {
                                Image(systemName: task.isCompleted ? "circle.fill" : "circle")
                                    .imageScale(.large)
                                    .foregroundColor(.accent)
                                    .onTapGesture {
                                        task.isCompleted.toggle()
                                    }
                                Text(task.taskName)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    viewModel.delete(task)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        .foregroundColor(Color.red)
                                }
                                
//                                Button{
//                                    editing.toggle()
//                                } label: {
//                                    Label("Flag", systemImage: "flag")
//                                        .background(Color.infoColor)
//                                }
//                                .tint(Color.accent)
                                
                                Button{
                                    editing.toggle()
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                        .background(Color.infoColor)
                                }
                                .tint(Color.infoColor)
                                
                            
                            }
                        }
//                        .onDelete(perform: viewModel.delete)
                        
                    }
                }
                
            }
            
            .navigationTitle(Info.Logo.logoText)
    
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: presentAddReminderView) {
                        AddButton()
                            .padding(.bottom, 50)
                    }
                }
            }
            .sheet(isPresented: $addTask) {
                AddToDoList { adding in
                    viewModel.add(adding)
                }
            }
            .background(Color.backround)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
