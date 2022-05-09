//
//  VideoView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-09.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    
    let strYouTube: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(strYouTube)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    
    }
}
