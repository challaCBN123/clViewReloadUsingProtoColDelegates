//
//  File.swift
//  clViewReloadUsingProtoColDelegates
//
//  Created by Bhargava on 13/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import UIKit


class gettindData:NSObject{
    func getData(url:URL?,completionHandler:@escaping (_ data:AnyObject, _ err:String)->Void){
            var urlRequest = URLRequest(url: url! )
            urlRequest.httpMethod = "GET"
            let session = URLSession.shared
            let task = session.dataTask(with: url!) { (data, response, err) in
                guard let data = data, err == nil else { return }
                //print(data)
               // guard let mimeType = response?.mimeType, mimeType.hasPrefix("image") else {return}
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                   //print("challa \(jsonData)")
                    if err == nil{
                        completionHandler(jsonData as AnyObject,  "")
                    } else {
                        let dataObject:[Any] = []
                        completionHandler(dataObject as AnyObject, err!.localizedDescription)
                    }
                }
                catch{
                    
                }
            }
            task.resume()
        }
}

