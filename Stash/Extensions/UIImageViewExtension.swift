//
//  UIImageViewExtension.swift
//  Stash
//
//  Created by zhangyihua on 1/14/20.
//

import UIKit

extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
    
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
            self.alpha = 0.0
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1.0
            })
            
         }
      }
   }
}
