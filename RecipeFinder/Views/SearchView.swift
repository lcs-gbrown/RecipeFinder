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
    
    // Keeps the list of recipes retrieved from JSON
    @State var foundRecipes: [Recipe] = [] // empty array to start
    
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
    //MARK: Functions
    func fetchResults() async {
        
        
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")
        
    
        let url = URL(string: "www.themealdb.com/api/json/v1/1/lookup.php?i=\(input)")!
        
       
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        
        let urlSession = URLSession.shared
        
      
        do {
          
            let (data, _) = try await urlSession.data(for: request)
            
            print(String(data: data, encoding: .utf8)!)
            

            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            
            
            foundRecipes = decodedSearchResult.results
            
        } catch {
            

            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
