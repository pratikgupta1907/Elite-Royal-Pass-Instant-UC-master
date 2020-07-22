//
//  HistoryCell.swift
//  Elite Royal Pass Instant UC
//
//  Created by pratik gupta on 20/07/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "this is the text for the tile of our label inside of our cell"
        return label
    }()
    
    let dateLbel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this is the author for the tile of our label of our cell"
        return label
    }()
    
    let pendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.font = UIFont(name: "Montserrat-Bold", size: 10)
        label.text = "Pending"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(dateLbel)
        addSubview(pendingLabel)
        
        backgroundColor = .clear
        coverImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        coverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: pendingLabel.leftAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        //pendingLabel
        
        pendingLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 5).isActive = true
        pendingLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        pendingLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pendingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15).isActive = true
        
        dateLbel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        dateLbel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        dateLbel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        dateLbel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
