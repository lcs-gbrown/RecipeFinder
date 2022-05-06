//
//  SearchView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-06.
//

import SwiftUI

struct SearchView: View {
   //MARK: Stored Properties
   
    @State var searchText = ""
    
    //MARK: Computed Properties
    
    var body: some View {
        
    
        NavigationView {
            
            VStack(alignment: .leading) {
                
                List {
                    Text("A")
                    Text("B")
                    Text("C")
                    
                }
                .searchable(text: $searchText)
                .onChange(of: searchText) { whatWasTyped in
                    print(whatWasTyped)
                    
                }
                
            }
            .navigationTitle("Search Recipes")
        }
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
