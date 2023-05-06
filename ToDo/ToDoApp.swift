//
//  ToDoApp.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabView {
                    ListView()
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
}
