//
//  LandmarkCell.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 08.06.2021.
//

import SnapKit
import UIKit
final class LandmarkCell: UITableViewCell {
    
    // MARK: Elements init
    var imgView: CircleImageView = {
               let image = CircleImageView()
                image.translatesAutoresizingMaskIntoConstraints = false
                image.layer.cornerRadius = image.frame.width/2
                image.layer.masksToBounds = true
                return image
            }()
    
    var nameLabel: UILabel = {
               let name = UILabel()
                name.translatesAutoresizingMaskIntoConstraints = false
        
                return name
            }()
    
    func configure(viewModel: ListViewViewModel) {
        // MARK: Elements settings
        self.accessoryType = .disclosureIndicator
        imgView.image = UIImage(named: "\(viewModel.imageName)" )
        nameLabel.text = viewModel.name
        if viewModel.favorite == true {
            let fullString = NSMutableAttributedString(string: "\(viewModel.name) ")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "star.fill")
            let imageString = NSAttributedString(attachment: imageAttachment)
            fullString.append(imageString)
            nameLabel.attributedText = fullString
        }
        
        
        // MARK: Elements Constaints
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.left.equalTo(imgView.snp.right).offset(5)
            make.bottom.equalToSuperview().offset(2)
        }
    }
}
