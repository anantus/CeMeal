//
//  EmptyRecipePlaceholderView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 04/07/22.
//

import SwiftUI

struct EmptyRecipePlaceholderView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.gray)
                .padding()
            
            Text("No recipe found")
                .foregroundColor(Color.ui.title)
                .padding(.bottom)
        }
    }
}

struct EmptyRecipePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRecipePlaceholderView()
    }
}
