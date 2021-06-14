//
//  ListViewModel.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 08.06.2021.
//

import Foundation
import UIKit
import MapKit
final class ListViewModel {
    
    
    var markList: [LandmarkJSON] = []
    
    // MARK: Data fetch func
    func getData(tableView: UITableView) {
        DispatchQueue.global(qos: .background).async {
            self.markList = JsonLoad.service.getData()
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
        }
    
    // MARK: Data checking
    func viewModelForMark(at index: Int) -> ListViewViewModel? {
        guard index < markList.count else {
                return nil
            }
        return ListViewViewModel(landmark: markList[index])
        }
    
    // MARK: Pushing to details func
    func navigateToPost(view: UIViewController, name: String, latitude: Double, longitude: Double, imageName: String, isFavorite: Bool, details: String, state: String){
        
        let rootvc = DetailViewController()
        let nc = view.navigationController
        
        rootvc.self.title = name
        rootvc.Coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        rootvc.placeImage.image = UIImage(named: imageName)
        
        if isFavorite == true {
            let fullString = NSMutableAttributedString(string: "\(rootvc.title!) ")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "star.fill")
            let imageString = NSAttributedString(attachment: imageAttachment)
            fullString.append(imageString)
            rootvc.placeName.attributedText = fullString
        } else {
            let fullString = NSMutableAttributedString(string: "\(rootvc.title!) ")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "star")?.withTintColor(.gray)
            let imageString = NSAttributedString(attachment: imageAttachment)
            fullString.append(imageString)
            rootvc.placeName.attributedText = fullString
        }
        
        
        rootvc.placeDetails.text = details
        rootvc.State.text = state
        
        rootvc.navigationItem.backButtonTitle =  "Landmarks"
        
        nc?.pushViewController(rootvc, animated: true)

    }
}
