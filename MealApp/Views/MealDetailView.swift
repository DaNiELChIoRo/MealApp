//
//  MealDetailView.swift
//  MealApp
//
//  Created by Daniel Meneses León on 22/08/23.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject var viewModel: Model = .init()

    let mealId: String
    let mealStr: String

    var body: some View {
        ScrollView {
            if let meal = viewModel.meal {
                AsyncImage(url: URL(string: meal.strMealThumb), scale: 2)
                VStack(alignment: .leading) {
                    if let instructions = meal.strInstructions {
                        Text("Instructions")
                            .font(.title)

                        Text(instructions)
                    }

                    Spacer()

                    Text("Ingredients")
                        .font(.title)
                    ForEach(meal.ingredients, id: \.self) { ingredient in
                        Text(" - " + ingredient)
                    }

                    Spacer()

                    Text("Measurements")
                        .font(.title)
                    ForEach(meal.measurements, id: \.self) { measurements in
                        Text(" - " + measurements)
                    }
                }

            } else {
                Text("Loading ...")
            }
        }
        .padding(.all)
        .navigationTitle(mealStr)
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentAlert) {

        }
        .task {
            await viewModel.fetchDetails(for: mealId)
        }
    }
}

extension MealDetailView {
    class Model: ViewModel {

        @Published var meal: Meal? = nil

        @MainActor
        func fetchDetails(for mealId: String) async {
            do {
                meal = try await networkManager.fetchMealDetails(for: mealId)
            } catch {
                self.presentAlert = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

struct MealDetailView_Preview: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealId: "52772", mealStr: "")
    }
}
