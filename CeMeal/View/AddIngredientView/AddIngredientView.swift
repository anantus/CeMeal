//
//  AddIngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 28/06/22.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Environment(\.presentationMode) var addIngredient: Binding<PresentationMode>
    @ObservedObject var ingredientsViewModel = IngredientViewModel()
    @State private var searchQuery = ""
    @State private var showDetailSheet: Bool = false
    
//    @State private var selectedIngredient: Ingredient?
    @State private var isEdit:Bool = false

    var body: some View {
        Group {
            List(ingredientsViewModel.ingredients.filter({ searchQuery.lowercased().isEmpty ? true : $0.ingredientName.lowercased().contains(searchQuery.lowercased()) })) { ingredient in
                Button {
                    showDetailSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        
                        Text("\(ingredient.ingredientName)")
                            .foregroundColor(.accentColor)
                    }
                }
                .sheet(isPresented: $showDetailSheet) {
                    IngredientDetailView(ingredient: ingredient)
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
                    self.addIngredient.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                }

            }
        }
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
    }
    
}

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddIngredientView()
        }
    }
}
