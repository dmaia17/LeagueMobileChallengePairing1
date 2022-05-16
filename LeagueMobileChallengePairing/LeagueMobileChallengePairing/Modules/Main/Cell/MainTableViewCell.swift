//
//  MainTableViewCell.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit
import SGImageCache

class MainTableViewCell: UITableViewCell {
  
  static let cellIdentifier: String = "MainTableViewCell"
  
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  func setup(post: PostModel) {
    iconImageView.setImageForURL(post.icon)
    nameLabel.text = post.name
    titleLabel.text = post.title
    descriptionLabel.text = post.description
  }
}
