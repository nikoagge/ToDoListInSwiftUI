//
//  ListRowView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 2/9/23.
//

import SwiftUI

struct ListRowView: View {
    let listRowTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(listRowTitle)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRowTitle: "Sample row")
    }
}
