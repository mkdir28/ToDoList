//
//  MainPageViewModel.swift
//  ToDoList
//
//  Created by Marina on 14.07.2024.
//

import SwiftUI

struct MainPageViewModel: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    
    @State private var editing = false
    
    @State private var sortSelection: SortingToDoList = .all
    
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
                    List {
                        ForEach($viewModel.tasks) { $task in
                            HStack {
                                Image(systemName: task.isCompleted ? "circle.fill" : "circle")
                                    .imageScale(.large)
                                    .foregroundColor(.accent)
                                    .onTapGesture {
                                        task.isCompleted.toggle()
                                    }
                                NavigationLink{
                                    AddToDoListModelView { adding in
                                        viewModel.add(adding)
                                    }
                                }
                                label: {
                                    Text(task.taskName)
                                }
                                
                            }
//                            HStack{
//                                Text(viewModel.deadline.formatted(date: .abbreviated,
//                                                                  time: .shortened))
//                                .foregroundStyle(.secondary)
//                                if(viewModel.reminderIsOn){
//                                    Image("calendar.bagde.clock")
//                                        .symbolRenderingMode(.multicolor)
//                                }
//                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    viewModel.delete(task)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }
                        .onMove(perform: viewModel.moveToDo)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Menu {
                        Picker("", selection: $sortSelection) {
                            ForEach(SortingToDoList.allCases, id: \.self) { sorting in
                                Text(sorting.rawValue)
                            }
                        }
                        .pickerStyle(.inline)
                       
                    } label: {
                        SortButton()
                    }
                }
            }
            .navigationTitle(Info.Logo.logoText)
            .font(.setFont(size: 16,
                           weight: .regular))
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: presentAddReminderView) {
                        AddButton()
                            .padding(.bottom, 50)
                    }
                }
            }
            .sheet(isPresented: $addTask) {
                AddToDoListModelView { adding in
                    viewModel.add(adding)
                }
            }
            .background(Color.orange)
            .onAppear {
                viewModel.filering()
            }
        }
    }
}

struct MainPageViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MainPageViewModel()
    }
}
