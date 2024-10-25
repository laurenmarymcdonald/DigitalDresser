//
//  CodableImage.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/22/24.
//

import Foundation
import SwiftUI
import PhotosUI
public struct CodableImage: Codable, Hashable {
    public let photo: Data
    public init(photo:UIImage) {
        self.photo = photo.pngData()!
    }
    
}
