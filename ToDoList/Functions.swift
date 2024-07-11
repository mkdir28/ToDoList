//
//  Functions.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//

import SwiftUI

final class Functiin: ObservableObject{
    
    @Published var isLoading = false
    
    @Published var tasks: [Option] {
        didSet{
            UserDefaults.standard.set(try? JSONEncoder().encode(tasks), forKey: "toDo")
        }
    }
    
    
    init(){
        isLoading = true
        tasks = UserDefaults.standard.data(forKey: "toDo").flatMap {
              try? JSONDecoder().decode([Option].self, from: $0)
        } ?? []
    }
    
    
    func add(_ addTask: Option) {
        tasks.append(addTask)
    }
    
    
    func delete(at deleteTask: IndexSet) {
        tasks.remove(atOffsets: deleteTask)
    }
    
    
    func sortByCreationDate(){
        tasks.sort{
            $1.byCreationDate > $0.byCreationDate
        }
    }
    

    func sortByCompletionDate(){
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
