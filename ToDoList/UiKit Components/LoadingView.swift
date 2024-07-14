//
//  LoadingView.swift
//  ToDoList
//
//  Created by Marina on 11.07.2024.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(Color.accentColor)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .infoColor))
                .scaleEffect(2)
        }
    }
}

struct WelcomePage: View {
    
    @Binding var showToDoList: Bool
    
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack {
                Text("Tangerine ToDoList🍊!")
                    .font(.setFont(size: 25,
                                   weight: .bold))
                    .multilineTextAlignment(.center) 
                    .padding()
                Button{
                    withAnimation {
                        showToDoList = true
                    }
                }label: {
                    GetStartedButton()
                }
            }
        }
    }
}
