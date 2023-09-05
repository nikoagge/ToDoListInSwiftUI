//
//  ListViewModel.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 4/9/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var listItems: [ListItem] = []
    
    init() {
        fetchListItems()
    }
    
    func fetchListItems() {
        listItems.append(contentsOf: [
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
        ])
    }
    
    func moveListItem(
        from: IndexSet,
        to: Int
    ) {
        listItems.move(
            fromOffsets: from,
            toOffset: to
        )
    }
    
    func deleteListItem(at indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func addListItem(with title: String) {
        listItems.append(ListItem(
            title: title,
            isCompleted: false
        ))
    }
    
    func updateListItem(_ listItem: ListItem) {
        if let index = listItems.firstIndex(where: { $0.id == listItem.id }) {
            listItems[index] = listItem.updateListItem()
        }
    }
}
