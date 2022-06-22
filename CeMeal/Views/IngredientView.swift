//
//  IngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct IngredientView: View {
    
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(.accentColor)
            
            .navigationTitle("Hi, Chef!")
            .navigationBarColor(backgroundColor: .white, titleColor: UIColor(Color.ui.title))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        }
    }
    
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
