//
//  RandomUserDataBean.swift
//  MGAppSample
//
//  Created by 黃俊傑 on 2018/8/3.
//  Copyright © 2018年 Soui. All rights reserved.
//

import Foundation

struct RandomUserDataBean: Codable {
    let results: [Result]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

struct Dob: Codable {
    let date: String
    let age: Int
}

struct ID: Codable {
    let name, value: String
}

struct Location: Codable {
    let street, city, state: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Coordinates: Codable {
    let latitude, longitude: String
}

struct Timezone: Codable {
    let offset, description: String
}

struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

struct Name: Codable {
    let title, first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}
