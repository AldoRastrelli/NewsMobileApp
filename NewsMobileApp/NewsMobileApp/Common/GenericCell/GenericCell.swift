//
//  GenericCell.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation
import UIKit

final class GenericCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let disclaimerLabel = UILabel()
    
    static let identifier = "GenericCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.separatorInset = .zero
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 3
        titleLabel.anchor(top: contentView.topAnchor, paddingTop: 10,
                          leading: contentView.leadingAnchor, paddingLeading: 24,
                          trailing: contentView.trailingAnchor, paddingTrailing: 24)
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.lineBreakMode = .byTruncatingTail
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 10,
                             leading: contentView.leadingAnchor, paddingLeading: 24,
                             trailing: contentView.trailingAnchor, paddingTrailing: 24)
        
        contentView.addSubview(disclaimerLabel)
        disclaimerLabel.translatesAutoresizingMaskIntoConstraints = false
        disclaimerLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        disclaimerLabel.anchor(top: subtitleLabel.bottomAnchor, paddingTop: 10,
                               leading: contentView.leadingAnchor, paddingLeading: 24,
                               trailing: contentView.trailingAnchor, paddingTrailing: 24, bottom: contentView.bottomAnchor, paddingBottom: 10)
    }
    
    func configure(title: String, subtitle: String, disclaimer: String?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        disclaimerLabel.text = disclaimer ?? ""
    }
}
