//
//  AddIngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 28/06/22.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Environment(\.presentationMode) var addIngredient: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @ObservedObject var ingredientsViewModel = IngredientViewModel()
    @State private var searchQuery = ""
    @State private var showDetailSheet: Bool = false
    @State private var selectedIngredient: Ingredient?

    var body: some View {
        Group {
            List(ingredientsViewModel.ingredients.filter({ searchQuery.isEmpty ? true : $0.title.contains(searchQuery) })) { ingredient in
                Button {
                    selectedIngredient = ingredient
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
            .sheet(item: $selectedIngredient) { item in
                IngredientDetailView(ingredient: selectedIngredient ?? Ingredient(title: "Empty", qty: 0.0, category: "Unknown", buyDate: Date(), unit: "unknown", isChecked: false))
            }
        }
        
        .navigationTitle("Add Ingredient")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.addIngredient.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                }

            }
        }
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            if value.startLocation.x < 20 && value.translation.width > 100 {
                self.addIngredient.wrappedValue.dismiss()
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
