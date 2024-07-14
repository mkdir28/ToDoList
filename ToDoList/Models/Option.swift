//
//  Option.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//

import SwiftUI

struct Option: Codable, Identifiable{
    var id = UUID()
    var taskName: String
    var isCompleted = false
    var dedline: Date?
    var byCompletionDate: Date?
    var byCreationDate = Date()
    var reminderIsOn: Bool = false
}
