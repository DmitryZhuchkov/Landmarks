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
            text.textColor = .lightGray
                return text
            }()
    
    var State: UILabel = {
            let text = UILabel()
            text.numberOfLines = 1
            text.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            text.translatesAutoresizingMaskIntoConstraints = false
            text.textColor = .lightGray
                return text
            }()
    
    let lineLabel: UILabel = {
           let line = UILabel()
           line.numberOfLines = 1
           line.backgroundColor = #colorLiteral(red: 0.8940909505, green: 0.8940883279, blue: 0.898322165, alpha: 1)
           return line
       }()
    
    let textLabel: UILabel = {
           let text = UILabel()
           text.numberOfLines = 50
           text.font = UIFont.systemFont(ofSize: 18, weight: .medium)
           text.textColor = .black
           return text
       }()
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var Coordinate:  CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
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
    
    
    
    // MARK: ScrollView constraints
    func setupScrollView(){
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           contentView.translatesAutoresizingMaskIntoConstraints = false
        
           view.addSubview(scrollView)
           scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.width.equalTo(scrollView.snp.width)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
       }
    
    func setupView() {
        
        // MARK: Elements constaints
        self.view.addSubview(placeCoord)
        placeCoord.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(view.frame.height/2)
        }
        
        self.view.addSubview(placeShadow)
        placeShadow.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalToSuperview()
            make.width.equalTo(placeCoord.snp.width).multipliedBy(0.7)
            make.height.equalTo(placeShadow.snp.width)
        }

        self.view.addSubview(placeImage)
        placeImage.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalToSuperview()
            make.width.equalTo(placeCoord.snp.width).multipliedBy(0.7)
            make.height.equalTo(placeImage.snp.width)
        }
        
        self.view.addSubview(placeName)
        placeName.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(4)
            make.top.equalTo(placeImage.snp.bottom).offset(15)
            make.right.equalTo(contentView.snp.right)
            
        }
        
        self.view.addSubview(placeDetails)
        placeDetails.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(4)
            make.top.equalTo(placeName.snp.bottom)
            
        }
        
        self.view.addSubview(State)
        State.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-4.0)
            make.top.equalTo(placeName.snp.bottom)
            
        }
        
        self.view.addSubview(lineLabel)
        lineLabel.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.right.equalTo(contentView.snp.right).offset(-4.0)
            make.top.equalTo(placeDetails.snp.bottom).offset(6)
            make.left.equalTo(contentView.snp.left).offset(4)
        }
        
        view.backgroundColor = .white
    }
}
