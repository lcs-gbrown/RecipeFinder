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
    @State var foundMeals: [Meal] = [] // empty array to start
    
    
    
    //MARK: Computed Properties
    
    var body: some View {
        
        NavigationView {
            
            ZStack {

                VStack {

                    List(foundMeals, id: \.idMeal) { currentMeal in
                        
                        NavigationLink(destination: RecipeDetailView(recipeId: currentMeal.idMeal)) {
                            ListItemView(meal: currentMeal)
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { whatWasTyped in
                        

                        Task {
                            await fetchResults()
                            
                        }
                    }

                    
                }
                


                VStack {
                    Spacer()
                    
                    Text("Enter a meal title")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .opacity(searchText.isEmpty ? 1.0 : 0.0)
                
            }
            .navigationTitle("Recipe Searcher")
            
        }

    }
    //MARK: Functions
    func fetchResults() async {
        
        
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")
        
        let urlToLoad = "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(input)"
        print(urlToLoad)
        
        
        let url = URL(string: urlToLoad)!
        
        
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        
        let urlSession = URLSession.shared
        
        
        do {
            
            let (data, _) = try await urlSession.data(for: request)
            
            print(String(data: data, encoding: .utf8)!)
            
            
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            
//            let recipe = decodedSearchResult.results.first!
            
            foundMeals = decodedSearchResult.meals
            
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
