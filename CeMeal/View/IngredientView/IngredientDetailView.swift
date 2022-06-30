//
//  IngredientDetailView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 30/06/22.
//

import SwiftUI

struct IngredientDetailView: View {
    
//    @Environment(\.isAddIngredientPresented) var isAddIngredientPresented
    @Environment(\.presentationMode) var detailSheet
    
    var ingredient: Ingredient
    
    var body: some View {
        NavigationView {
            Text(ingredient.title)
        
            .navigationTitle(ingredient.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        detailSheet.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }

                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        
                    } label: {
                        Text("Save")
                    }

                }
            }
        }
    }
}

struct IngredientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IngredientDetailView(ingredient: Ingredient(id: "0", title: "Empty", category: "Unknown", expireDay: [1], shelfLife: ["a": "b"]))
        }
    }
}
