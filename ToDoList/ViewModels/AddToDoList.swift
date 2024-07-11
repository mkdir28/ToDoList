//
//  AddToDoList.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//

import SwiftUI

struct AddToDoList: View {
    
    @ObservedObject var listOfTasks = Functiin()
    
    @State private var addTask = Option(taskName: "")
    
    @State private var startDate:Date = Date()
    
    @State private var deadline:Date = Date()
    
    @Environment(\.dismiss)
    
    private var dismiss
    
    
    enum FocusableField: Hashable{
        case title
    }
    
    @FocusState private var focus: FocusableField?
    
    var onCommit: (_ adding: Option) -> Void
    
    private func commit() {
        let newTask = Option(taskName: addTask.taskName,
                             isCompleted: false,
                             dedline: deadline,
                             byCreationDate: startDate)
        onCommit(newTask)
        dismiss()
    }
    
    private func reject(){
        dismiss()
    }

    var body: some View {
        HStack {
            NavigationStack {
                Form {
                    TextField(Info.AddTask.text, 
                              text: $addTask.taskName)
                        .focused($focus, equals: .title)
                    
                    DatePicker(Info.AddTask.startDate, 
                               selection: $startDate,
                               displayedComponents: [.date, .hourAndMinute])
                    .foregroundStyle(Color.orange)
                    .font(.setFont(size: 16,
                                   weight: .semibold))
                    
                    DatePicker(Info.AddTask.dueDate, 
                               selection: $deadline,
                               displayedComponents: [.date, .hourAndMinute])
                    .foregroundStyle(Color.orange)
                    .font(.setFont(size: 16,
                                   weight: .semibold))
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction){
                        Button(action: reject){
                            Text(Info.AddTask.cancel)
                                .foregroundStyle(Color.accentColor)
                                .font(.setFont(size: 20,
                                               weight: .bold))
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: commit) {
                            Text(Info.AddTask.addNewTask)
                                .foregroundStyle(Color.accentColor)
                                .font(.setFont(size: 20, 
                                               weight: .bold))
                        }
                        .disabled(addTask.taskName.isEmpty)
                    }
                }
                .onAppear {
                    focus = .title
                }
            }
        }
    }
}


struct AddReminderView_Previews: PreviewProvider {
  static var previews: some View {
      AddToDoList{ adding in
        print("Congratulations, you added a new task \(adding)")
      }
  }
}
