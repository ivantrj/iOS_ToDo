//
//  HabitViewModel.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 07.05.23.
//

import Foundation

class HabitViewModel: ObservableObject {
    @Published var habits = [HabitItemModel]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encodedData, forKey: Self.habitsKey)
            }
        }
    }
    
    private static let habitsKey = "Habits"
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: Self.habitsKey) {
            if let decodedHabits = try? JSONDecoder().decode([HabitItemModel].self, from: savedHabits) {
                habits = decodedHabits
                return
            }
        }
        
        // No saved habits found...
        habits = []
    }
    
    static let sampleHabits = [
        HabitItemModel(title: "Sample habit 1", description: "Let's get to it!", colorString: "Orange"),
        HabitItemModel(title: "Sample habit 2", description: "Get started now!", colorString: "Green"),
        HabitItemModel(title: "Sample habit 3", description: "I can do this!", colorString: "Purple")
    ]
}
