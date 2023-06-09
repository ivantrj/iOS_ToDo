//
//  ToDoApp.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject var listViewModel: ToDoListViewModel = ToDoListViewModel()
    
    var body: some Scene {
        WindowGroup {
                TabView {
                    ToDoListView()
                        .tabItem {
                            Label("To Do", systemImage: "checkmark")
                        }
                        .environmentObject(listViewModel)
                    HabitsView()
                        .tabItem {
                            Label("Habits", systemImage: "calendar.circle")
                        }
                    NotesView()
                        .tabItem {
                            Label("Notes", systemImage: "note.text")
                        }
                }
        }
    }
}
