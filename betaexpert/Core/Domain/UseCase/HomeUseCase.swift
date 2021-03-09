//
//  HomeUseCase.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

protocol HomeUseCase {
  
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void)

}

class HomeInteractor: HomeUseCase {
  
  private let repository: MealRepositoryProtocol
  
  required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }
  
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void) {
    repository.getCategories { res in
      result(res)
    }
  }
  
}
