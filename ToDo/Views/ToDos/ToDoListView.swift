//
//  ListView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var listViewModel: ToDoListViewModel
    @State private var showAddToDo = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("To Dos")
            .toolbar {
                Button{
                    showAddToDo = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                }
            }
            .sheet(isPresented: $showAddToDo) {
                ToDoAddView()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoListView()
        }
        .environmentObject(ToDoListViewModel())
    }
}
