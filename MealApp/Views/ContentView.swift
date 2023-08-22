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

                        NavigationLink(destination: MealDetailView(mealId: meal.idMeal, mealStr: meal.strMeal)) {
                            HStack {

                                AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                    image.image?.resizable()
                                }
                                .frame(width: 128, height: 128)

                                Text(meal.strMeal)
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
            .navigationBarTitle("Meal Details", displayMode: .large)
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentAlert) {

        }
        .task {
            await viewModel.fetchMeals()
        }
    }

}

extension ContentView {
    class Model: ViewModel {
        @Published var meals = [Meal]()

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
