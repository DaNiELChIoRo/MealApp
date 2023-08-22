//
//  ViewModelable.swift
//  MealApp
//
//  Created by Daniel Meneses León on 22/08/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var errorMessage: String = ""
    @Published var presentAlert = false

    lazy var networkManager = {
        NetworkManager.shared
    }()
}
