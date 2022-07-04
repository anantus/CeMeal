//
//  BadgeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct CapsuleView: View {
    
    var ingredient: AdditionalIngredient!
    
    var body: some View {
        HStack {
            Text(ingredient.title ?? "")
            Image(systemName: "x.square.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        .background(Color.accentColor)
        .cornerRadius(10)
        .padding(.vertical, 8)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView()
    }
}
