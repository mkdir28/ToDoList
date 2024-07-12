//
//  SortingToDoList.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI

enum SortingToDoList{
    case byCompletion
    case byDeadline
    case byCreation
}

struct SortingPreview: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    
    @State private var sortSelection: SortingToDoList?
    
    @State private var sorting = false
    
    private func presentSortView() {
        sorting.toggle()
    }
    
    var body: some View {
        Button(action: presentSortView) {
            SortButton()
                .padding(.init(top: 0,
                               leading: 0,
                               bottom: 0,
                               trailing: 300)
                )
        }
        .sheet(isPresented: $sorting) {
            VStack {
                Button(action: {
                    sortSelection = .byCompletion
                    viewModel.sorting(sort: .byCompletion)
                    sorting.toggle()
                }) {
                    Text(Info.Sorting.byCompletion)
                        .foregroundColor(Color.infoColor)
                        .multilineTextAlignment(.leading)
                        .font(.setFont(size: 20,
                                       weight: .bold))
                }
                .padding()
                
                Button(action: {
                    sortSelection = .byDeadline
                    viewModel.sorting(sort: .byDeadline)
                    sorting.toggle()
                }) {
                    Text(Info.Sorting.byDeadline)
                        .foregroundColor(Color.infoColor)
                        .multilineTextAlignment(.leading)
                        .font(.setFont(size: 20,
                                       weight: .bold))
                }
                .padding()
                
                Button(action: {
                    sortSelection = .byCreation
                    viewModel.sorting(sort: .byCreation)
                    sorting.toggle()
                }) {
                    Text(Info.Sorting.byCreation)
                        .foregroundColor(Color.infoColor)
                        .multilineTextAlignment(.leading)
                        .font(.setFont(size: 20,
                                       weight: .bold))
                }
                .padding()
            }
        }
        
    }
}

struct SortingPreview_Previews: PreviewProvider {
  static var previews: some View {
      SortingPreview()
  }
}
