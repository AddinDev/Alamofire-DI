//
//  MealRepository.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

protocol MealRepositoryProtocol {
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void)
}

class MealRepository {
  
  typealias MealInstance = (RemoteDataSource) -> MealRepository
  fileprivate let remote: RemoteDataSource
  
  private init(remote: RemoteDataSource) {
    self.remote = remote
  }
  
  static let sharedInstance: MealInstance = { remoteRepo in
    return MealRepository(remote: remoteRepo)
  }
  
}

extension MealRepository: MealRepositoryProtocol {

  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void) {
    remote.getCategories { remoteResponses in
      switch remoteResponses {
      case .success(let categoryResponses):
        let resultList = CategoryMapper.mapCategoryResponsesToDomains(input: categoryResponses)
        result(.success(resultList))
      case .failure(let error):
        result(.failure(error))
      }
    }
  }

}
