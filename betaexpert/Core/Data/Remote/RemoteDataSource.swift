//
//  RemoteDataSource.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import Foundation
import Alamofire

protocol RemoteDataSourceProtocol {
  func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void)
}

class RemoteDataSource: NSObject {
  
  private override init() {}
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getCategories(result: @escaping (Result<[CategoryResponse], URLError>) -> Void) {
    guard let url = URL(string: EndPoints.Gets.categories.url) else { return }
    AF.request(url).validate()
      .responseDecodable(of: CategoriesResponse.self) { response in
        switch response.result {
        case .success(let value):
          result(.success(value.categories))
        case .failure:
          result(.failure(.invalidResponse))
        }
      }
  }
  
}
