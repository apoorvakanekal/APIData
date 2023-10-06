//
//  ContentView.swift
//  APIData
//

import SwiftUI
import Foundation


struct ContentView: View {
    @ObservedObject var contentViewModel = ContentViewModel()
    
    @State var searchText = ""
    @State var selectedCountry: Country?
    
    var body: some View {
        
        NavigationView{
            List(searchResults) { city in
                VStack(alignment: .leading) {
                    Button("\(city.name.common)"){
                        selectedCountry = city
                    }
                    .foregroundColor(.blue)
                }
            }
            .task{
                await contentViewModel.getAllCities()
            }
            .sheet(item: $selectedCountry) { city in
                DetailsView(country:city)
            }
            .navigationTitle("Countries")
            .searchable(text:$searchText)
        }
    }
    var searchResults: [Country] {
        if searchText.isEmpty {
            return contentViewModel.cities
        }
        else{
            return contentViewModel.cities.filter{
                $0.name.common.contains(searchText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

