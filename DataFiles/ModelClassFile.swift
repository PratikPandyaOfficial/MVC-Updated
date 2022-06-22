//
//  ModelClassFile.swift
//  API Call with GET Method
//
//  Created by Drashti on 22/06/22.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class ModelClass {
    
    typealias array = [Any]
    typealias dictionary = [String:Any]
    typealias images = UIImage
    
    class func GetJSONDataFromAPI(URL:String, completion:@escaping (dictionary?,array?,String?) -> Void){
        
        AF.request(URL).responseJSON { response in
            switch(response.result){
            case.failure(let error):
                completion(nil,nil,error.localizedDescription)
            case.success(let value):
                
                if (value as? [Any]) != nil{
                    completion(nil,value as? [Any],nil)
                }else if  (value as? [String:Any]) != nil
                {
                    completion(value as? [String:Any], nil, nil)
                }else{
                    print("Dictionary or array not found")
                }
                
            }
        }
    }
    
    class func GetJSONDataFromParameter(URL:String,Passarameters:[String:Any],completion:@escaping (dictionary?,array?,String?) -> Void)  {
        
        AF.request(URL, method: HTTPMethod.post, parameters: Passarameters as Parameters).responseJSON { (response:AFDataResponse) in
            switch(response.result){
            case.failure(let error):
                completion(nil,nil,error.localizedDescription)
            case.success(let value):
                
                if (value as? [Any]) != nil{
                    completion(nil,value as? [Any],nil)
                }else if  (value as? [String:Any]) != nil
                {
                    completion(value as? [String:Any], nil, nil)
                }else{
                    print("Dictionary or array not found")
                }
                
            }
        }
    }
    
    class func DownloadImage(url: String, completion: @escaping (images) -> Void ){
        
        var images = UIImage()
        
        let url = URL(string: url)!
        AF.request(url.absoluteString).responseImage { response in
            
            switch(response.result){
            case .success(let img):
                images = img
                completion(images)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}


extension UIImageView{
    func DownloadImage(url:String){
        AF.request(url).responseImage { (result) in
            switch(result.result){
                
            case .success(let value):
                self.image = value
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
