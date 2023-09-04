//
//  ListView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 2/9/23.
//

import SwiftUI

struct ListView: View {
    @State var listItems = [
        ListItem(
            title: "First Title",
            isCompleted: false
        ),
        ListItem(
            title: "Second Title",
            isCompleted: true
        ),
        ListItem(
            title: "Third Title",
            isCompleted: false
        )
    ]
    
    var body: some View {
        List {
            ForEach(listItems) { listItem in
                ListItemView(listItem: listItem)
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
