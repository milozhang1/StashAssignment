//
//  Achievement.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation

struct Achievement: Codable {
    var id: Int
    var level: String
    var progress: Int
    var total: Int
    var bigImageUrl: URL
    var accessible: Bool
    
    enum CodingKeys: String, CodingKey {
        case bigImageUrl = "bg_image_url"
        case id
        case level
        case progress
        case total
        case accessible
    }
}

struct AchievementResponse: Codable {
    struct OverView: Codable {
        var title: String
    }
    
    var success: Bool
    var status: Int
    var overview: OverView
    var achievements: [Achievement]
}
