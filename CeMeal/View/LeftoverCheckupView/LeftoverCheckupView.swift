//
//  LeftoverCheckupView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import SwiftUI

struct LeftoverCheckupView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var leftoverViewModel = LeftoverViewModel()
//    @State private var redirectToTabbedView = false
    
    var body: some View {
//        if !redirectToTabbedView {
        List {
            Text("Do you use all your ingredients?")
                .font(
                    .title
                    .weight(.bold)
                )
            
            ForEach(leftoverViewModel.leftovers) { leftover in
                HStack {
                    // Checkbox
                    Image(systemName: leftover.isChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
//                                withAnimation(.easeOut) {
//                                    leftoverViewModel.leftoverIsChecked(leftover: leftover)
//                                }
                        }
                    .foregroundColor(.accentColor)
                    
                    // Content
                    LeftoverListView(leftover: leftover)
                }
                .padding(.horizontal)
            }
        }
        .listStyle(.plain)
        
        .navigationTitle("Leftover")
        .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
//        } else {
//            FavoriteView()
//                .navigationBarBackButtonHidden(true)
//        }
    }
    
}

struct LeftoverCheckupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LeftoverCheckupView()
        }
    }
}
