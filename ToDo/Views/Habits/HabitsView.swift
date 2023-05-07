//
//  HabitsView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 06.05.23.
//

import SwiftUI

struct HabitsView: View {
    @StateObject var habitViewModel = HabitViewModel()
    @State private var isShowingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitViewModel.habits) { habit in
                    NavigationLink {
                        HabitDetailView(
                            habitViewModel: habitViewModel,
                            habit: habit
                        )
                    } label: {
                        VStack(alignment: .leading) {
                            Text(habit.title)
                                .foregroundColor(habit.color ?? .black)
                            
                            Spacer(minLength: 10)
                            
                            Text(
                                habit.completionCount == 1 ?
                                "1 completion to date." : "\(habit.completionCount) completions to date."
                            )
                                .font(.subheadline.italic())
                            
                        }
                        .padding(.vertical, 5)
                    }
                }
                .onMove { indexSet, index in
                    habitViewModel.habits.move(fromOffsets: indexSet, toOffset: index)
                }
                .onDelete { offsets in
                    habitViewModel.habits.remove(atOffsets: offsets)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if habitViewModel.habits.count > 0 {
                        EditButton()
                    }
                    
                    Button {
                        isShowingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddHabit) {
                HabitAddView(habitViewModel: habitViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
