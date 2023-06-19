//
//  SDWebImageManager.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/19.
//

import UIKit
import SDWebImage

class SDWebImageManager {
    
    private init() {}
    
    static let shared = SDWebImageManager()
    
    /// 圖片快取
    private let imageCache = NSCache<NSURL, UIImage>()
    
    func setImage(imageView: UIImageView, imgUrl: String) {
        guard let url = URL(string: imgUrl) else {
            imageView.image = UIImage(systemName: "photo.artframe")
            return
        }
        
        if let image = imageCache.object(forKey: url as NSURL) {
            imageView.image = image
            print("檔案存在快取,直接取用, url: \(url.absoluteString)")
            return
        }
        
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo.artframe")) { [weak self] (image, _, _, url) in
            if let url = url, let image = image {
                self?.imageCache.setObject(image, forKey: url as NSURL)
            }
        }
    }
}
