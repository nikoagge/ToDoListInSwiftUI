//
//  ListItem.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 4/9/23.
//

import Foundation

struct ListItem: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted:Bool
}
