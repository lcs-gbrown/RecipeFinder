//
//  RecipeDetailView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-06.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: Stored properties
    
    @State var searchText = ""
    
    var recipeId: String
    
    @State var foundRecipe = testRecipe
    
    @State var inFavourites: Bool
    
    @Binding var favourites: [Recipe]
    
    
    // MARK: Computed properties
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading)  {
                
                Text(foundRecipe.strMeal)
                    .font(.largeTitle)
                
                // Navigation is restricted
                WebView(address: foundRecipe.strYoutube.replacingOccurrences(of: "watch", with: "watch_popup"),
                        restrictToAddressBeginningWith: "")
                    .border(.black, width: 1.0)
                // A height must be specified if additional content is placed below the web view.
                    .frame(height: 250)
                
                    
                    Link("View recipe", destination: URL(string: foundRecipe.strSource)!)
                        .padding(.top, 5)
                    
                    
                    List(favourites, id: \.idMeal) { currentRecipe in
                        
                        FavouritesButtonView(recipe: currentRecipe,
                                             inFavourites: $inFavourites,
                                             favourites: $favourites)
                        
                        
                        Link("View video", destination: URL(string: foundRecipe.strYoutube)!)
                            .padding(.top, 5)
    //                }
                    
                    Text(foundRecipe.strInstructions)
                        .font(.body)
                    
                    
                
                .padding()
                .task {
                    await fetchRecipe()
                }
                
            }
        }
        
    }
    }
    func fetchRecipe() async {
        
        
        
        let urlToLoad = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)"
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
            
            
            let decodedRecipeIngredient = try JSONDecoder().decode(RecipeIngredient.self, from: data)
            
            foundRecipe = decodedRecipeIngredient.meals.first!
            
            print(dump(foundRecipe))
            
        } catch {
            
            
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
        
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeId: "", inFavourites: false, favourites: .constant([]))
    }
}
