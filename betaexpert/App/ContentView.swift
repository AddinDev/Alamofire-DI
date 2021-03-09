//
//  ContentView.swift
//  betaexpert
//
//  Created by addin on 09/03/21.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var presenter: HomePresenter
  
    var body: some View {
        HomeView(presenter: presenter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
