//
//  ListView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 2/9/23.
//

import SwiftUI

struct ListView: View {
    @State var listRowsTitle = [
        "First Title",
        "Second Title",
        "Third Title"
    ]
    
    var body: some View {
        List {
            ForEach(
                listRowsTitle,
                id: \.self
            ) { listRowTitle in
                ListRowView(listRowTitle: listRowTitle)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("+") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
