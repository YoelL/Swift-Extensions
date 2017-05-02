//
//  UIImageView.swift
//
//
//  Created by Yoel Lev on 3/13/17.
//  Copyright © 2017 YoeLevDevelopment. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    //fetch image profile from a URL Using URLSession and DispatchQueue main async
    
    func loadImageUsingCacheWithUrlString(urlString:String){
        
        
        self.image = nil
        
        //check cache for image first
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cacheImage
            return
        }
        
        
        //otherwise fire off a new download
        
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil { print(error!); return}
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data:data!){
                    
                    imageCache.setObject(data! as AnyObject, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                }
            }
        })
        task.resume()
    }
}
