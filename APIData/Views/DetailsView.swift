//
//  DetailsView.swift
//  APIData
//
//

import SwiftUI
import MapKit


struct DetailsView: View{
    @Environment(\.dismiss) var dismiss
    let country: Country
    
    var pushNotificationService = PushNotificationService()
    
    var body: some View{
        NavigationView{
            VStack{
                Button("Press to dismiss"){
                    dismiss()
                }
                
                Button("Ask for push notification permissions"){
                    pushNotificationService.requestPermissions()
                }
                .padding(.vertical, 16)
                
                Button("Remind me about this country"){
                    pushNotificationService.scheduleNotification(title: country.name.common, subtitle: "Don't forget about \(country.name.common)!")
                }
                
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
                
                
                Map{
                    Marker(" \(country.name.common)" , coordinate:country.capitalInfo.coordinate!)
                }
                .controlSize(.small)
                .frame(width:300, height:200)
                .mapControls{
                    MapScaleView()
                }
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

