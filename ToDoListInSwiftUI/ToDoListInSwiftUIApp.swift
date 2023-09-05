//
//  ToDoListInSwiftUIApp.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 2/9/23.
//

import SwiftUI

/*
 
 MVVM Architecture
 
 Model - Data
 View - UI
 ViewModel - Manages Models for View
 
 */


@main
struct ToDoListInSwiftUIApp: App {
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
