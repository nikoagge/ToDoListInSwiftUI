//
//  ListItem.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 4/9/23.
//

import Foundation

struct ListItem: Identifiable {
    let id: String
    let title: String
    let isCompleted:Bool
    
    init(
        id: String = UUID().uuidString,
        title: String,
        isCompleted: Bool
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateListItem() -> ListItem {
        return ListItem(
            id: id,
            title: title,
            isCompleted: isCompleted
        )
    }
}
