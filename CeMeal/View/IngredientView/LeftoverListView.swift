//
//  IngredientListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct LeftoverListView: View {
    
    @ObservedObject var leftoverViewModel = LeftoverViewModel()
    var leftover: Leftover
    
    var body: some View {
        HStack {
            // Checkbox
            Image(systemName: leftover.isChecked ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    withAnimation(.easeOut) {
                        leftoverViewModel.leftoverIsChecked(leftover: leftover)
                    }
                }
                .foregroundColor(.accentColor)
            
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
                    .font(
                        .system(.callout, design: .serif)
                        .italic()
                    )
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.accentColor)
                    
                    Text(dateToString(leftover.buyDate))
                        .foregroundColor(.gray)
                    
                    Image(systemName: "plus.square.fill.on.square.fill")
                        .foregroundColor(.accentColor)
                    
//                    Text(leftover.qty.clean.description)
//                        .foregroundColor(.gray)
                }
                .padding(.top, 1)
                
            }
            .padding(.horizontal, 16)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverListView(leftover: Leftover(id: "123", title: "Chicken Breast", category: "Poultry", buyDate: Date(), expireDate: Date(), storage: "Fridge", isChecked: true))
    }
}
