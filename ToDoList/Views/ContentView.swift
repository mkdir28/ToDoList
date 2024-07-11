//
//  ContentView.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    
    @State var newTask:String = ""
    
    @State private var addTask = false

    private func presentAddReminderView() {
        addTask.toggle()
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    if viewModel.isLoading {
                        LoadingView()
                    } else {
                        if viewModel.isEmpty {
                            EmptyState()
                        } else {
                            List {
                                ForEach($viewModel.tasks) { $task in
                                    HStack {
                                        Image(systemName: task.isCompleted ? "circle.fill" : "circle")
                                            .imageScale(.large)
                                            .foregroundColor(task.isCompleted ? .green : .red)
                                            .onTapGesture {
                                                task.isCompleted.toggle()
                                            }
                                        Text(task.taskName)
                                    }
                                }
                                
                                .onDelete(perform: viewModel.delete)
                            }
                        }
                    }
                }
                .navigationTitle(Info.Logo.logoText)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: presentAddReminderView) {
                            AddButton()
                        }
                        .offset(y: -50)
                    }
                }
                .sheet(isPresented: $addTask) {
                    AddToDoList { adding in
                        viewModel.add(adding)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ContentView()
    }
  }
}
