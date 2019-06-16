//
//  ResourceDetailCell.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

public class ResourceDetailCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var readingListButton: UIButton!
    @IBOutlet private weak var durationLabel: UILabel!
    
    private var dataTask: URLSessionDataTask?
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        dataTask?.cancel()
    }
}

// MARK: - Public Helpers

public extension ResourceDetailCell {
    func customize(with model: ResourceDetail.GetResourceDetail.Article) {
        newsImageView.image = UIImage(named: "detail_placeholder")
        
        if let imageUrl = URL(string: model.urlToImage) {
            downloaded(from: imageUrl)
        }
        
        titleLabel.text = model.title
        readingListButton.setTitle("-", for: .normal)
        
        let publishTime = getFormattedDate(model.publishedAt)
        durationLabel.text = publishTime
    }
}

// MARK: - Private Helpers

private extension ResourceDetailCell {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.newsImageView.image = image
            }
        }
        dataTask?.resume()
    }
    
    func getFormattedDate(_ date: String) -> String {
        let formattedDate = date.split(separator: "T").last?.description.dropLast().description
        return formattedDate ?? "-"
    }
}
