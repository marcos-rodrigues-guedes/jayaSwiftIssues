//
//  StringExtension.swift
//  SwiftIssues
//
//  Created by marcos.guedes on 10/5/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
// formating date to string with formatter yyyy-MM-dd'T'HH:mm:ssZ"
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
