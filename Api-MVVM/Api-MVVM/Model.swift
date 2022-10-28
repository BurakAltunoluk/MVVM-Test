//
//  Model.swift
//  Api-MVVM
//
//  Created by Burak Altunoluk on 28/10/2022.
//

import Foundation


// MARK: - Welcome
struct Welcome: Decodable
{
    let comments: [Comment]
    let total, skip, limit: Int
}

// MARK: - Comment
struct Comment: Decodable {
    let id: Int
    let body: String
    let postId: Int
    let user: User
}

// MARK: - User
struct User: Decodable {
    let id: Int
    let username: String
}
