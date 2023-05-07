//
//  Habits.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 07.05.23.
//

import Foundation

class Habits: ObservableObject{
    @Published var items = [HabitItemModel](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([HabitItemModel].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}
