//
//  Date+Ext.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//

import SwiftUI

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
