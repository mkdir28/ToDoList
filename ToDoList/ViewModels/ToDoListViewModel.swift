//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//


import SwiftUI

final class ToDoListViewModel: ObservableObject{
    
    @Published var isLoading = false
    
    @State private var sortSelection: SortingToDoList = .all
    
    @Published var editing: Option?
    
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
//    
    
    func add(_ addTask: Option) {
        tasks.append(addTask)
    }
    
    
    func delete(_ deleteTask: Option) {
        withAnimation{
            tasks.removeAll(where: { $0.id == deleteTask.id })
        }
        
    }
    
    func edit(_ editTask: Option) {
        if let index = tasks.firstIndex(where: { $0.id == editTask.id }) {
            tasks[index] = editTask
        }
    }

//    
//    func sorting(sort: SortingToDoList){
//        switch sort{
//        case .byCompletion:
//            tasks.sort{
//                $0.byCompletionDate ?? Date.distantFuture < $1.byCompletionDate ??  Date.distantFuture
//            }
//        case .byDeadline:
//            tasks.sort{
//                $0.dedline ?? Date.distantFuture < $1.dedline ??  Date.distantFuture
//            }
//        case .byCreation:
//            tasks.sort{
//                $1.byCreationDate > $0.byCreationDate
//            }
//        case .all:
//            break
//        }
//    }
    
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
    
//    
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
    
//    func byCompletion()-> Bool{
//        if let due = byDeadline(){
//
//        }
//        return byCompletion != nil
//    }
//    
//    func byDeadline() -> String{
//        return ""
//    }

    func sortByDeadline(){
        tasks.sort{
            $0.dedline ?? Date.distantFuture < $1.dedline ??  Date.distantFuture
        }
    }
    
//    func loading(){
////        isLoading = true
////        let seconds = 5.0
////        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
////            self.isLoading = false
////        }
//        
//    }
//    
    var isEmpty: Bool{
        tasks.isEmpty
    }
    
}

