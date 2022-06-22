//
//  DataClassFile.swift
//  API Call with GET Method
//
//  Created by Drashti on 22/06/22.
//

import Foundation


class albumData{
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
    init(data:[String:Any]){
        self.albumId = data["albumId"] as? Int ?? 0
        self.id = data["id"] as? Int ?? 0
        self.title = data["title"] as? String ?? "N/A"
        self.url = data["url"] as? String ?? "N/A"
        self.thumbnailUrl = data["thumbnailUrl"] as? String ?? "N/A"
    }
    
}
