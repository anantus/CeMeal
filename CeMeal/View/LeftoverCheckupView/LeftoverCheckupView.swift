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
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoversViewModel
    
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    //    @State private var redirectToTabbedView = false
    
    var body: some View {
        //        if !redirectToTabbedView {
        List {
            Text("Do you use all your ingredients?")
                .font(
                    .title
                        .weight(.bold)
                )
            
            ForEach(getCheckedLeftover()) { leftover in
                HStack {
                    // Checkbox
                    
                    Image(systemName: leftover.isUsed ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            leftoversViewModel.usedLeftovers(ingredient: leftover, context: viewContent)
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
                    delCheckedLeftover()
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
    
    func getCheckedLeftover() -> [Leftovers] {
        var checkedLeftover : [Leftovers] = []
        for lo in fetchedLeftovers{
            if lo.isChecked{
                checkedLeftover.append(lo)
            }
        }
        return checkedLeftover
    }
    
    func delCheckedLeftover(){
        for lo in fetchedLeftovers{
            if lo.isUsed{
                leftoversViewModel.delete(ingredient: lo, context: viewContent)
            }
        }
    }
    
}

struct LeftoverCheckupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LeftoverCheckupView()
        }
    }
}
