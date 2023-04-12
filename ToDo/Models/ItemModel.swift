//
//  ItemModel.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
