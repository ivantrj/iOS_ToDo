//
//  ListViewModel.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 13.04.23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "first title", isCompleted: false),
            ItemModel(title: "second title", isCompleted: true),
            ItemModel(title: "third title", isCompleted: false),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
