//
//  DetailView.swift
//  Hacker News
//
//  Created by Abhinav Goel on 9/5/25.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
