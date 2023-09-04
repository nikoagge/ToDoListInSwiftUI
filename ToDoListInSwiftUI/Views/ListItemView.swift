//
//  ListItemView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 2/9/23.
//

import SwiftUI

struct ListItemView: View {
    let listItem: ListItem
    
    var body: some View {
        HStack {
            Image(systemName: listItem.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(listItem.isCompleted ? .green : .red)
            Text(listItem.title)
            Spacer()
        }
        .font(.title2)
        .padding(
            .vertical,
            8
        )
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListItemView(listItem: ListItem(
                title: "First item",
                isCompleted: false
            ) )
            
            ListItemView(listItem: ListItem(
                title: "Second item",
                isCompleted: true
            ) )
        }
        .previewLayout(.sizeThatFits)
    }
}
