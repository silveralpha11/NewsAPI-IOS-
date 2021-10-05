//
//  ContentView.swift
//  NewsAPI
//
//  Created by macbook on 04/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationView{
            List(newsViewModel.data){ item in
                NavigationLink(destination: NewsDetail(news: item)){
                HStack{
                    // jika fotonya ada
                    if item.image != ""{
                        WebImage(url: URL(string: item.image)!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 170)
                            .background(Image("loader")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 30))
                            .cornerRadius(10)
                    } else {
                        Image("loader")
                            .resizable()
                            .frame(width: 120, height: 170)
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(item.title).fontWeight(.bold).lineLimit(2)
                        
                        Text(item.description).font(.caption).lineLimit(4)
                        }
                    }
                }
            }
            .navigationBarTitle("News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
