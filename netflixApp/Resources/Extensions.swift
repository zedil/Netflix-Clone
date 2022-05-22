//
//  Extensions.swift
//  netflixApp
//
//  Created by Dilara Şimşek on 22.05.2022.
//

import Foundation

extension String {
    func capitalFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
