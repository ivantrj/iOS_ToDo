//
//  AddView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type here..", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                .cornerRadius(10)
            
//                Button(action: {}, label: {
//                    Text("WTF")
//                        .foregroundColor(.blue)
//                        .font(.headline)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .backgroundStyle(Color.accentColor)
//                        .cornerRadius(10)
//                })
                
                Button(action: {}, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
