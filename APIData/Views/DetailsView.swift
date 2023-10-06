//
//  DetailsView.swift
//  APIData
//
//

import SwiftUI
    
    
struct DetailsView: View{
    @Environment(\.dismiss) var dismiss
    let country: Country
    
    var body: some View{
        NavigationView{
            VStack{
                Button("Press to dismiss"){
                    dismiss()
                }
                Text("Flag:")
                AsyncImage(url: URL(string:"\(country.flags.png)"))
                Text("Coat of Arms:")
                //https://medium.com/@dicmandilan/how-do-you-resize-an-internet-image-fetched-using-a-url-in-swiftui-ios-development-bbd6d3c50a42
                AsyncImage(url: URL(string: "\(country.coatOfArms?.png ?? "")")){ phase in switch phase{
                case .empty:
                          Image(systemName: "photo")
                              .frame(width: 100, height: 100)
                      case .success(let image):
                          image.resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(maxWidth: 100, maxHeight: 100)
                      case .failure:
                          Image(systemName: "photo")
                              .frame(width: 100, height: 100)
                      @unknown default:
                          EmptyView()
                              .frame(width: 100, height: 100)
                }
                }
                .frame(width: 100, height: 100)
                Text("Region: \(country.region)")
                Text("Population: \(country.population)")
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("\(country.name.common)" + "\(country.flag)")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

