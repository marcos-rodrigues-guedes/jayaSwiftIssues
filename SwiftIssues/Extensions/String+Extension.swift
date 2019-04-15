//
//  StringExtension.swift
//  SwiftIssues
//
//  Created by virtus on 15/04/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation

extension String {
    func dateToString(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        dateFormatter.dateStyle = DateFormatter.Style.full
        return dateFormatter.string(from: date)
        
    }
}
