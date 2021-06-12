//
//  ListViewViewModel.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 09.06.2021.
//

import Foundation
final class ListViewViewModel {
    
       private var landmark: LandmarkJSON
       
       
       init(landmark: LandmarkJSON) {
           self.landmark = landmark
       }
       // MARK: Landmark info
       var imageName: String {
        let imageName = landmark.imageName
           return imageName
       }
    
       var details: String {
        let details = "\(landmark.park)  \(landmark.state)  "
        return details
        }
    
       var name: String {
        let name = landmark.name
           return name
       }
    
       var favorite: Bool {
        let favorite = landmark.isFavorite
           return favorite
       }
    
      var latitude: Double {
        let latitude = landmark.coordinates.latitude
        return latitude
       }
    
      var longitude: Double {
        let longitude = landmark.coordinates.latitude
        return longitude
    }
}
