//
//  DetailViewController.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 08.06.2021.
//

import UIKit
import MapKit
import SnapKit
final class DetailViewController: UIViewController {
    // MARK: Elements init
    var placeImage: CircleImageView = {
                let image = CircleImageView()
                return image
            }()
    
    var placeShadow: CircleShadowView = {
                let shadow = CircleShadowView()
                return shadow
            }()
        
        var placeName: UILabel = {
               let text = UILabel()
            text.translatesAutoresizingMaskIntoConstraints = false
            text.font = UIFont.systemFont(ofSize: 23, weight: .medium)
            text.numberOfLines = 1
            text.textColor = .black
                return text
            }()
    
    var placeCoord: MKMapView = {
           let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    var placeDetails: UILabel = {
            let text = UILabel()
            text.numberOfLines = 1
            text.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            text.translatesAutoresizingMaskIntoConstraints = false
            text.textColor = .black
                return text
            }()
    
    var State: UILabel = {
            let text = UILabel()
            text.numberOfLines = 1
            text.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            text.translatesAutoresizingMaskIntoConstraints = false
            text.textColor = .black
                return text
            }()
    
    var Coordinate:  CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // MARK: Map view settings
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: Coordinate, span: span)
        placeCoord.setRegion(region, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // MARK: Large title bug fix
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupView() {
        
        // MARK: Elements constaints
        self.view.addSubview(placeCoord)
        placeCoord.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(view.frame.height/2)
        }
        
        self.view.addSubview(placeShadow)
        placeShadow.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(placeCoord.snp.width).multipliedBy(0.7)
            make.height.equalTo(placeShadow.snp.width)
        }

        self.view.addSubview(placeImage)
        placeImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(placeCoord.snp.width).multipliedBy(0.7)
            make.height.equalTo(placeImage.snp.width)
        }
        
        self.view.addSubview(placeName)
        placeName.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(placeImage.snp.bottom).offset(15)
            make.right.equalToSuperview()
            
        }
        
        self.view.addSubview(placeDetails)
        placeDetails.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(placeName.snp.bottom)
            
        }
        
        self.view.addSubview(State)
        State.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(placeName.snp.bottom)
            make.left.equalTo(placeDetails.snp.right)
            
        }
        
        view.backgroundColor = .white
    }
}
