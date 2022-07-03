//
//  IngredientListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct LeftoverListView: View {
    
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoversViewModel
    @ObservedObject var leftover:Leftovers
    
    var body: some View {
        HStack {
            // Content
            VStack(alignment: .leading) {
                
                // Title
                Text(leftover.title)
                    .font(
                        .title3
                        .weight(.semibold)
                    )
                    .foregroundColor(Color.ui.title)
                    .textCase(.uppercase)
                
                // Category
                Text(leftover.category)
                    .foregroundColor(.accentColor)
                
                // Content
                VStack(alignment: .leading) {
                    
                    // Title
                    Text(leftover.ingredients!)
                        .font(
                            .title3
                                .weight(.semibold)
                        )
                        .foregroundColor(Color.ui.title)
                        .textCase(.uppercase)
                    
                    // Category
                    Text(leftover.category ?? "no category")
                        .foregroundColor(.accentColor)
                        .font(.subheadline)

                    Text(dateToString(leftover.buyDate))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    Image(systemName: "calendar")
                        .foregroundColor(Color.ui.accent2)
                        .font(.subheadline)

                    Text(dateToString(leftover.expireDate))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.horizontal, 16)
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .padding(.vertical, 10)
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverListView(leftover: Leftover(id: "123", title: "Chicken Breast", category: "Poultry", buyDate: Date(), expireDate: Date(), storage: "Fridge", isChecked: true))
    }
}
