//
//  HabitAddView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 07.05.23.
//

import SwiftUI

struct HabitsAddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var habitName = ""
    @State private var habitDescription = ""
    @State private var habitDate:Date = Date.now
    @ObservedObject var habits: Habits
    @State private var showingAlert = false
    
    var body: some View {
        Text("Hello")
    }
    
    
    func saveHabit() {
        if (habitName != "") {
            let item = HabitItemModel(habitName: self.habitName, habitDescription: self.habitDescription, habitDate: self.habitDate, habitCompletionCount: 0)
            self.habits.items.insert(item, at: 0)
            self.dismiss()
            return
        } else {
            showingAlert = true
            return
        }
    }
}


struct HabitsAddView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsAddView(habits: Habits())
    }
}
