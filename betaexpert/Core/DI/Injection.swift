//
//  Injection.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

final class Injection {
  
  private func provideRepo() -> MealRepositoryProtocol {
    
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return MealRepository.sharedInstance(remote)
  }
  
  func provideHome() -> HomeUseCase {
    
    let repo = provideRepo()
    
    return HomeInteractor(repository: repo)
  }
  
}
