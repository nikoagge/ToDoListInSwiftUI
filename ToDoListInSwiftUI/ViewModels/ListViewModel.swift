//
//  ListViewModel.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 4/9/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var listItems: [ListItem] = [] {
        didSet {
            saveListItems()
        }
    }
    
    init() {
        fetchListItems()
    }
    
    func fetchListItems() {
        guard
            let listItemsEncodedData = UserDefaults.standard.data(forKey: UserDefaultsKeys.listItems.rawValue),
            let savedListItems = try? JSONDecoder().decode(
                [ListItem].self,
                from: listItemsEncodedData
            )
        else { return }
        listItems = savedListItems
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
    
    func saveListItems() {
        if let listItemsEncodedData = try? JSONEncoder().encode(listItems) {
            UserDefaults.standard.set(
                listItemsEncodedData,
                forKey: UserDefaultsKeys.listItems.rawValue
            )
        }
    }
}
