//
//  ListRowView.swift
//  ToDo
//
//  Created by Ivan Trajanovski on 12.04.23.
//

import SwiftUI

struct ListRowView: View {
    
    var title: String

    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text("First item")
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "title")
    }
}
