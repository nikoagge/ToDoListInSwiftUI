//
//  NoListItemsView.swift
//  ToDoListInSwiftUI
//
//  Created by Nikos Aggelidis on 5/9/23.
//

import SwiftUI

struct NoListItemsView: View {
    @State var isAnimated = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 13) {
                Text("There are no items in the list!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("You should add items in your to-do list!")
                    .padding(
                        .bottom,
                        20
                    )
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add List Item")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 58)
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? Color.red : Color.accentColor)
                        .cornerRadius(13)
                }
                .padding(
                    .horizontal,
                    isAnimated ? 31 : 58
                )
                .shadow(
                    color: isAnimated ? Color.red.opacity(0.8) : Color.accentColor.opacity(0.8),
                    radius: 13,
                    x: 0,
                    y: isAnimated ? 58 : 31
                )
                .scaleEffect(isAnimated ? 1.3 : 1)
                .offset(y: isAnimated ? -8 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                animate()
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
    
    func animate() {
        guard !isAnimated else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                isAnimated.toggle()
            }
        }
    }
}

struct NoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoListItemsView()
                .navigationTitle("No items")
        }
    }
}
