//
//  ContentView.swift
//  MealApp
//
//  Created by Daniel Meneses León on 22/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: Model = .init()

    var body: some View {
        NavigationView {
            List {
                if !viewModel.meals.isEmpty {
                    ForEach(viewModel.meals) { meal in

                        NavigationLink(destination: Text(meal.strMeal)) {
                            HStack {Text(meal.strMeal)
                                    .font(.title)
                                    .padding()
                            }
                        }
                    }
                } else {
                    Text("Loading...")
                        .padding()
                }

            }
        }
        .navigationBarTitle("Meal Details", displayMode: .large)
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentAlert) {

        }
        .task {
            await viewModel.fetchMeals()
        }
    }

}

extension ContentView {
    class Model: ObservableObject {
        @Published var meals = [Meal]()
        @Published var errorMessage: String = ""
        @Published var presentAlert: Bool = false
        private lazy var networkManager = {
            NetworkManager.shared
        }()

        @MainActor
        func fetchMeals() async {
            do {
                meals = try await networkManager.fetchMeals()
            } catch {
                errorMessage = error.localizedDescription
                presentAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
