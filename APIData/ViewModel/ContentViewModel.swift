//
//  ContentViewModel.swift
//  APIData
//
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var cities = [Country]()

        func getAllCities() async -> () {
            do{
                let url = URL(string: "https://restcountries.com/v3.1/all")!
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                cities = try JSONDecoder().decode([Country].self, from:data)
            } catch{
                print("Error: \(error.localizedDescription)")
            }

        }
        }

