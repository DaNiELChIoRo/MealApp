# MealApp
Simple iOS MealApp Implementing network calls from `themealdb.com` API that allows users to navigate to all the Desert catalogs.

## Previews

<img width=320 src="https://github.com/DaNiELChIoRo/MealApp/assets/39627096/7bab7561-1f2c-46ea-85e8-ae1861f61e5c"/>

<img width=320 src="https://github.com/DaNiELChIoRo/MealApp/assets/39627096/21ba7305-7117-414d-adc1-0bcadbfa627e"/>

<img width=320 src="https://github.com/DaNiELChIoRo/MealApp/assets/39627096/2df428b6-af24-454a-87d4-4a6307a0ffcb"/>

## Networking

For networking the app uses *async/await* Swift Concurrency.

## Architecture

The app is built using SwiftUI without any dependencies, using MVVM architecture 

### Views

All the views were created using SwiftUI and can be previewed by accessing them on the `Views` folder

### ViewModel

All ViewModels are located within the view file. This, in order to save time and effort since the app is not long enough to be worth it.
Tough in order to reuse some functionality they inherit from a parent class called `ViewModel` which contains a reused property for scalability. 
Better practices shall be used in the future.

### Models

Since there is a single Model (`Meal`) it is contained in a single file located in the `Model` folder.

# REQUIREMENTS

- MacOS
- Xcode installed
- Internet access
