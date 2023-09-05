//
//  AddView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 3/9/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type something here...",
                    text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 58)
                .background(.yellow)
                .cornerRadius(13)
                
                Button {
                    saveButtonPressed()
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
        .alert(
            alertTitle,
            isPresented: $showAlert) {
                Button(
                    "Ok",
                    role: .cancel
                ) {}
            }
    }
    
    func saveButtonPressed() {
        if isTextValid() {
            listViewModel.addListItem(with: textFieldText)
            dismiss()
        }
    }
    
    func isTextValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "New item should be at least 3 characters long!"
            showAlert.toggle()
            
            return false
        }
        
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
