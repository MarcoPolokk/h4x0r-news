//
//  ContentView.swift
//  hacker-news
//
//  Created by Paweł Kozioł on 09/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                List(networkManager.posts) { post in
                    NavigationLink(
                        destination: DetailView(url: post.url),
                        label: {
                            HStack {
                                
                                Text(String(post.points))
                                Text(post.title)
                            }
                        })
                }
                .navigationTitle("Hacker News")
            }
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyHeader: View {
    var body: some View {
        Text("Upvotes")
    }
}
