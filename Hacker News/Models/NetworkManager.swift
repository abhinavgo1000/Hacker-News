//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Abhinav Goel on 9/5/25.
//

import Foundation

class NetworkManager: ObservableObject {
    
    let urlString = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
