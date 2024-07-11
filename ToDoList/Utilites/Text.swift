//
//  Text.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import Foundation

struct Info{
    //EmptyState
    struct EmptyState{
        static let noTasks: String = "No tasks to do"
        static let  transcription: String = "Create your new task to get started your career!"
    }
    
    //AddButton
    struct Button{
        static let text: String = "Add Task"
    }
    
    //Logo Title of an app
    struct Logo{
        static let logoText: String = "ToDoList 🍊"
    }
    
    //AddToDoList
    struct AddTask{
        static let text: String = "Add new task"
        static let startDate: String = "Start Date"
        static let dueDate: String = "Due Date"
        static let addNewTask: String = "Add"
        static let cancel: String = "Cancel"
        
    }
}
