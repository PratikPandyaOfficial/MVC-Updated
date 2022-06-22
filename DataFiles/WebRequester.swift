//
//  WebRequester.swift
//  API Call with GET Method
//
//  Created by Drashti on 22/06/22.
//

import Foundation
import ARKit

class WebRequester{
    
    static var shared = WebRequester()
    
    
    func getPhotos(success:@escaping([albumData]) -> Void){
        ModelClass.GetJSONDataFromAPI(URL: url.mainUrl) { dic, arr, err in
            var returnData = [albumData]()
            var arrData = arr ?? [Any]()
            returnData = arrData.map({albumData(data: $0 as! [String:Any])})
            
            success(returnData)
        }
    }
}
    
