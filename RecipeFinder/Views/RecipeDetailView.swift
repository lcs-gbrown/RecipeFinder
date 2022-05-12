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
    
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading)  {
                
                Text(foundRecipe.strMeal)
                    .font(.largeTitle)
                
                // Navigation is restricted
                WebView(address: foundRecipe.strYouTube.replacingOccurrences(of: "watch", with: "watch_popup"),
                        restrictToAddressBeginningWith: "")
                .border(.black, width: 1.0)
                // A height must be specified if additional content is placed below the web view.
                .frame(height: 250)
                
        
                
                Link("View recipe", destination: URL(string: foundRecipe.strSource)!)
                                    .padding(.top, 5)
                
                Text(foundRecipe.strInstructions)
                    .font(.body)
                
                
               
                Link("View video", destination: URL(string: foundRecipe.strYouTube)!)
                    .padding(.top, 5)
            }
            
            .padding()
        }
      
    }
    
    func fetchRecipe() async {
        
        
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")
        
        
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        
        
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
            
        } catch {
            
            
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
        
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeId: "")
    }
}
