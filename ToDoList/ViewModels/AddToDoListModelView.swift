//
//  AddToDoList.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//
import SwiftUI

struct AddToDoListModelView: View {
    
    @EnvironmentObject var listOfTasks: ToDoListViewModel
    
    @State private var addTask = Option(taskName: "")
    
    @State private var startDate:Date = Date()
    
    @State private var deadline:Date = Date()
    
    @Environment(\.dismiss) private var dismiss
    
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
//                    Toggle("Set Reminder:", isOn: $addTask.reminderIsOn)
//                        .padding(.top)
//                        .listRowSeparator(.hidden)
                    DatePicker(Info.AddTask.startDate,
                               selection: $startDate,
                               displayedComponents: [.date, .hourAndMinute])
                    .tint(Color.orange)
                    .foregroundStyle(Color.accent)
                    .font(.setFont(size: 16,
                                   weight: .semibold))
                    
                    DatePicker(Info.AddTask.dueDate,
                               selection: $deadline,
                               displayedComponents: [.date, .hourAndMinute])
                    .tint(Color.orange)
                    .foregroundStyle(Color.accent)
                    .font(.setFont(size: 16,
                                   weight: .semibold))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction){
                        Button(action: reject){
                            Text(Info.AddTask.cancel)
                                .foregroundStyle(Color.accent)
                                .font(.setFont(size: 20,
                                               weight: .bold))
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: commit) {
                            Text(Info.AddTask.addNewTask)
                                .foregroundStyle(Color.accent)
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
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct AddToDoList_Previews: PreviewProvider {
  static var previews: some View {
      AddToDoListModelView{ adding in
        print("Congratulations, you added a new task \(adding)")
      }
  }
}
