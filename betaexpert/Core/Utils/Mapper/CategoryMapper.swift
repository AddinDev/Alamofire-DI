//
//  CategoryMapper.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

final class CategoryMapper {
  
  static func mapCategoryResponsesToDomains(input categoryResponses: [CategoryResponse]) -> [CategoryModel] {
    
    return categoryResponses.map { result in
      return CategoryModel(id: result.id ?? "",
                           title: result.title ?? "Unknown",
                           image: result.image ?? "Unknown",
                           description: result.description ?? "Unknown")
    }
    
  }
  
}
