//
//  Helper.swift
//  SwiftIssues
//
//  Created by user917337 on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
import SDWebImage

class Helper {
    
    // MARK: - Helper functions
    // set user issue image in Image View
    static func setUserAvatar(userAvarImageView: UIImageView, url: String) {
         userAvarImageView.sd_setImage(with: URL(string: url),
                                             placeholderImage: UIImage(named: "image.png"))
    }
    // open issue in browser
    static func openURL(url: String) {
        if let url = URL(string: url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    // decode data object with snakeCase strategy
    static func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from,
            let response = try? decoder.decode(type.self, from: data) else { return nil }
        
        return response
    }
}
