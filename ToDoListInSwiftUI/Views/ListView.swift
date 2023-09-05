//
//  ListView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 2/9/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.listItems.isEmpty {
                NoListItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.listItems) { listItem in
                        ListItemView(listItem: listItem)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateListItem(listItem)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteListItem)
                    .onMove(perform: listViewModel.moveListItem)
                }
                .listStyle(PlainListStyle())
            }
        }
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
        .environmentObject(ListViewModel())
    }
}
