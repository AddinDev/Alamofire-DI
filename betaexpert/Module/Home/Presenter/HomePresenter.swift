//
//  HomePresenter.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import SwiftUI

class HomePresenter: ObservableObject {
 
  private let homeUseCase: HomeUseCase
  
  @Published var categories: [CategoryModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getCategories() {
    loadingState = true
    homeUseCase.getCategories { result in
      switch result {
      case .success(let categories):
        DispatchQueue.main.async {
          self.loadingState = false
          self.categories = categories
        }
      case .failure(let error):
        self.loadingState = false
        self.errorMessage = error.localizedDescription
      }
    }
  }
  
}
