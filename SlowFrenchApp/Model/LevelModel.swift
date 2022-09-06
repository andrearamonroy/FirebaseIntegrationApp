//
//  LevelModel.swift
//  SlowFrenchApp
//
//  Created by Andrea on 8/27/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


public struct Level : Codable, Identifiable {
    @DocumentID public var id: String? = UUID().uuidString //maps document id from firestore to this one
    let levelName : String
    let units : [Unit]?
    
    enum CodingKeys: String, CodingKey {
        case levelName
        case units
    }
}

//unit
struct Unit : Codable{
    @DocumentID public var id: String? = UUID().uuidString
    let unitName : String
    let podcasts : [Podcast]?
    
    enum UnitKeys: String, CodingKey{
        case unitName
        case podcasts
    }
}


//podcast
struct Podcast: Codable {
    let podcastName: String
    let podcastTime: String
    
    enum PodcastKeys: String, CodingKey{
        case podcastName
        case podcastTime
    }
 }
