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
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
