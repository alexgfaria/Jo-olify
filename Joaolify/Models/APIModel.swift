//
//  APIModel.swift
//  Joaolify
//
//  Created by Alex Faria on 17/10/2022.
//

import Foundation

struct Movie: Codable {

    let adult: Bool?
    let backdrop_path: String?
    let belongs_to_collection: Collection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdb_int: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Float? //number
    let poster_path: String?
    let production_companies: [ProductionCompanies]?
    let production_countries: [ProductionCountries]?
    let release_date: String?
    let runtime: Int?
    let spoken_languages: [SpokenLanguages]?
    let status: String?
    let tagline: String?
}

struct Genre: Codable {

    let id: Int?
    let name: String?
}

struct Collection: Codable {

    let id: Int?
    let name: String?
    let overview: String?
    let poster_path: String?
    let backdrop_path: String?
    let parts: [Part]
}

struct Part: Codable {

    let adult: Bool?
    let backdrop_path: [Int]?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let release_date: String?
    let poster_path: String?
    let popularity: Float?
    let title: String?
    let video: Bool?
    let vote_average: Float?
    let vote_count: Int?
}

struct Popular: Codable {

    let page: Int?
    let results: [Result]?
    let total_results: Int?
    let total_pages: Int?
}

struct Result: Codable {

    let poster_path: String?
    let adult: Bool?
    let overview: String?
    let release_date: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_title: String?
    let original_language: String?
    let title: String?
    let backdrop_path: String?
    let popularity: Float?
    let vote_count: Int?
    let video: Bool?
    let vote_average: Float?
}

struct Genres: Codable {

    let id: Int?
    let name: String?
}

struct ProductionCompanies: Codable {

    let name: String?
    let id: Int?
    let logo_path: String?
    let origin_country: String?
}

struct ProductionCountries: Codable {

    let iso_3166_1: String?
    let name: String?
}

struct SpokenLanguages: Codable {

    let iso_639_1: String?
    let name: String?
}
