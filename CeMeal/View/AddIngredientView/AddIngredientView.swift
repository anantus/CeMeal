//
//  AddIngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 28/06/22.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @ObservedObject var ingredientsViewModel = IngredientViewModel()
    @State private var searchQuery = ""

    var body: some View {
        Group {
            List(ingredientsViewModel.ingredients.filter({ searchQuery.isEmpty ? true : $0.title.contains(searchQuery) })) { ingredient in
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        
                        Text("\(ingredient.title)")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .listStyle(.plain)
        }
        
        .navigationTitle("Add Ingredient")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                }

            }
        }
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            if value.startLocation.x < 20 && value.translation.width > 100 {
                self.mode.wrappedValue.dismiss()
            }
        }))
    }
}

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddIngredientView()
        }
    }
}
