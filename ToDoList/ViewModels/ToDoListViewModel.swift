//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//


import SwiftUI

final class ToDoListViewModel: ObservableObject{
    
    @State private var sortSelection: SortingToDoList = .all
    
    @Published var tasks: [Option] {
        didSet{
            UserDefaults.standard.set(try? JSONEncoder().encode(tasks), forKey: "toDo")
        }
    }
    
    
    init(){
        tasks = UserDefaults.standard.data(forKey: "toDo").flatMap {
              try? JSONDecoder().decode([Option].self, from: $0)
        } ?? []
    }
 
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        tasks.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
  
    
    func add(_ addTask: Option) {
        if let index = tasks.firstIndex(where: { $0.id == addTask.id }) {
            tasks[index] = addTask
        }
        else{
            tasks.append(addTask)
        }
    }
    
    
    func delete(_ deleteTask: Option) {
        withAnimation{
            tasks.removeAll(where: { $0.id == deleteTask.id })
        }
        
    }

    
    func updating(toDo: Option) {
        if let index = tasks.firstIndex(where: { $0.id == toDo.id }) {
            tasks[index] = toDo
        } else {
            var newToDo = toDo
            newToDo.id = UUID()
            tasks.append(newToDo)
        }
    }
    
    
    func filering(){
        if sortSelection == SortingToDoList.byCompletion{
            sortByCompletione()
        }
        if sortSelection == SortingToDoList.byCreation{
            sortByCreationDate()
        }
        if sortSelection == SortingToDoList.byDeadline{
            sortByDeadline()
        }
    }
    
//    func toggleFlaged(_ task: Option){
//        if let task = tasks.firstIndex(where: { $0.id == task.id }) {
//            tasks[task].isFlagged.toggle()
//        }
//    }
    
 
    func sortByCreationDate(){
        tasks.sort{
            $1.byCreationDate > $0.byCreationDate
        }
    }
    

    func sortByCompletione(){
        tasks.sort{
            $0.byCompletionDate ?? Date.distantFuture < $1.byCompletionDate ??  Date.distantFuture
        }
    }
    

    func sortByDeadline(){
        tasks.sort{
            $0.dedline ?? Date.distantFuture < $1.dedline ??  Date.distantFuture
        }
    }

    
    var isEmpty: Bool{
        tasks.isEmpty
    }
}
