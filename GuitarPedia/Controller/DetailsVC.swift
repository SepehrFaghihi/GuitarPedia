//
//  DetailsVC.swift
//  GuitarPedia
//
//  Created by Sahand Raeisi on 8/1/23.
//

import Foundation
import UIKit

class DetailsVC: UIViewController {
    
    var initialObject: Guitar!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.image = initialObject.avatar
        titleLabel.text = initialObject.title
        modelLabel.text = initialObject.model
        descriptionLabel.text = initialObject.description
    }
    
}
