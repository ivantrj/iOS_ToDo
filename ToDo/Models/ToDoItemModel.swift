//
//  ItemModel.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import Foundation

// immutable struct

struct ToDoItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ToDoItemModel {
        return ToDoItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
