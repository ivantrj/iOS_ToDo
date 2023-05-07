//
//  HabitItemModel.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 07.05.23.
//

import Foundation

struct HabitItemModel: Identifiable,Codable,Equatable{
    var id = UUID()
    let habitName: String
    let habitDescription: String
    let habitDate:Date
    var habitCompletionCount: Int{
        didSet{
            if habitCompletionCount < 0 {
                habitCompletionCount = 0
            }
        }
    }
}
