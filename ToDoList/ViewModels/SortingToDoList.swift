//
//  SortingToDoList.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI
import SwiftData

enum SortingToDoList: String, CaseIterable{
    case byCompletion = "Completion"
    case byDeadline = "Deadline"
    case byCreation = "Creation"
    case all = "All"
}
