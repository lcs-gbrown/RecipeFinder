//
//  RemoteImageView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-09.
//

import SwiftUI

struct RemoteImageView: View {
    // MARK: Stored properties
    
    // What image to show
    let fromURL: URL
    
    // MARK: Computed properties
    var body: some View {
        
        // Retrieves and displays a remote image, showing a placeholder until the image has loaded
        AsyncImage(url: fromURL,
                   content: { downloadedImage in
            downloadedImage
                .resizable()
                .scaledToFit()
        },
                   placeholder: {
            ProgressView()
        })
    

    }
    
}

struct RemoteImageView_Previews: PreviewProvider {
    
    // Uses a website that provides a different 640x360 image each time the address is loaded
    static let example = URL(string: testRecipe.strMealThumb)!
    
    static var previews: some View {
        RemoteImageView(fromURL: example)
    }
}
