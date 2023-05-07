//
//  HabitAddView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 07.05.23.
//

import SwiftUI

struct HabitAddView: View {
    @ObservedObject var habitViewModel: HabitViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var color: Color = .blue
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Habit title", text: $title)
                    
                    TextField("Habit description", text: $description)
                }
                
                Section {
                    CustomColorPicker(selectedColor: $color)
                }
            }
            .navigationTitle("Add a new habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        let newHabit = HabitItemModel(
                            title: title,
                            description: description,
                            // I need to update the actual colorString to be encoded/decoded,
                            // not the computed color property.
                            colorString: Color.habitColors[color, default: nil]
                        )
                        habitViewModel.habits.append(newHabit)
                        
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitAddView(habitViewModel: HabitViewModel())
            .preferredColorScheme(.dark)
    }
}
