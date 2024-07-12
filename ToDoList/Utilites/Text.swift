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
        static let  transcription: String = "Create a new task for your career to get started!"
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
    
    //Sorting
    struct Sorting{
        static let byCompletion: String = "Sort by Completion Date"
        static let byDeadline: String = "Sort by Deadline"
        static let byCreation: String = "Sort by Creation Date"
    }
}
