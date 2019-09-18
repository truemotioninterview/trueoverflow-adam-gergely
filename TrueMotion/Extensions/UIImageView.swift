//
//  UIImageView.swift
//  TrueMotion
//
//  Created by Adam Gergely on 9/18/19.
//  Copyright © 2019 true. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageUrl(_ url: String?) {
        guard let url = url else {
            return
        }
        self.kf.setImage(with: URL(string: url))
    }
}
