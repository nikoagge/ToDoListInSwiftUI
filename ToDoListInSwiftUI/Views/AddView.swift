//
//  AddView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 3/9/23.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type something here...",
                    text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 58)
                .background(.gray)
                .cornerRadius(13)
                
                Button {
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 58)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(13)
                }

            }
            .padding(13)
        }
        .navigationTitle("Add an item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
