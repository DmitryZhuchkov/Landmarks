//
//  Landmark.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 08.06.2021.
//

import Foundation

// MARK: - LandmarkJSONElement
struct LandmarkJSONElement: Codable {
    let name: String
    let category: Category
    let city, state: String
    let id: Int
    let park: String
    let coordinates: Coordinates
    let imageName: String
    let isFavorite: Bool
}

enum Category: String, Codable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let longitude, latitude: Double
}

typealias LandmarkJSON = LandmarkJSONElement
