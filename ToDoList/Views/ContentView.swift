//
//  ContentView.swift
//  ToDoList
//
//  Created by Marina on 10.07.2024.
//
import SwiftUI

struct ContentView: View {
    
    @State var progress: CGFloat = 0
    
    @State var doneLoading: Bool = false
    
    @State private var showToDoList:Bool = false
    
    var body: some View {
        ZStack {
            if doneLoading {
                WelcomePage(showToDoList: $showToDoList)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
            } else {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.progress = 0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                withAnimation {
                                    self.doneLoading = true
                                }
                                
                            }
                        }
                    }
            }
            if showToDoList {
                MainPageViewModel()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
