//
//  ListView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "first title",
        "second title",
        "third title",
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Do List📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
