//
//  Recipe.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/23/24.
//

import Foundation


struct Recipe: Codable {
    let label: String  // Recipe title
    let image: String  // Image URL
    let ingredientLines: [String]  // Array of ingredient strings
    let instructions: String?  // Recipe instructions, if available (you may need to check other fields such as `source` or `url`)
}
