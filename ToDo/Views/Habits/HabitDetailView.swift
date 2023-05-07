//
//  HabitDetailView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 07.05.23.
//

import SwiftUI


struct HabitDetailView: View {
    @State var habit: HabitItemModel
    @ObservedObject var habits: Habits
    let colums = [GridItem(.adaptive(minimum: 5))]
    var body: some View {
        Text("Habits Detail View")
    }
    
    
    func save(){
        guard let index = habits.items.firstIndex(where: {$0.id == habit.id }) else { return }
        habits.items[index].habitCompletionCount = habit.habitCompletionCount
    }
    
}
