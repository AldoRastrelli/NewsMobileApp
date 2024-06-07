
https://github.com/AldoRastrelli/NewsMobileApp/assets/54607131/27e1e138-1d07-414b-91c2-b0fae75516f1
# NewsMobileApp

This project was built with Swift. It is a simple news app that fetches news from the News API and displays them in a list. The user can tap on a news article to view more details about it.
On another tab, the user can scroll through its friends list and tap on a friend to view more details about them, including their location on a map.

## iPhone 15 Pro
https://github.com/AldoRastrelli/NewsMobileApp/assets/54607131/f7903e65-e6fa-49a1-8d76-ea33623f990f
## iPhone ES
https://github.com/AldoRastrelli/NewsMobileApp/assets/54607131/5c8ee68a-2327-4af9-9cd8-bb1864a71422


## How the Project was Built

The project was built in the span of 3 days. The first day was spent on setting up the project and creating the tab bar. The second day was spent on fetching the user data and displaying it in a list, and same for the news. The third day was spent on adding the map feature for the users and the details view for the news.

Additionally, some small features were added, such as refresh control, and the hability to tap outside the search bar to dismiss the keyboard.

The project was planned in this [Notion Board](https://aldanarastrelli.notion.site/iOS-Technical-Challenge-d6ae227ae84e4c92b262e35791032605?pvs=4).

A Mockup was created in Whimsical to guide the development of the project. It can be found [here](https://whimsical.com/newsmobileapp-4TSdg5swN8K9Y6Hoj1e8bg).

## How to Run the Project
The projects needs CocoaPods to run. If you don't have CocoaPods installed, you can install it following these [instructions](https://stackoverflow.com/questions/20755044/how-do-i-install-cocoapods).

After installing CocoaPods, navigate to the project folder in your terminal (you should see a 'Pods' directory inside it) and run `pod install`. Then, open the `NewsMobileApp.xcworkspace` file in Xcode and run the project.

## About the Project
### Architecture
The project was built using the MVVM architecture. The ViewModel is responsible for fetching the data from the API and parsing it. The ViewController is responsible for displaying the data and handling user interactions. The Model is responsible for holding the data, and was created with the [QuickType tool](https://app.quicktype.io/).

### Networking
The project uses asynchronous networking to fetch data from the News API.

### Reactive Programming
The project uses Combine to handle the asynchronous networking and to update the UI when the data is fetched.

## Dependencies
The project uses the following dependencies:
- GoogleMaps: to display the map with the user's location.

## File Organization
The project is organized by modules. Inside the `Modules` directory, there are two modules: `Posts` and `Friends`. Each module has its own submodules. Each submodule has its own directory with the following structure:

- Model: contains the Model
- View: contains the ViewController
- ViewModel: contains the ViewModel

Along with the submodules, there is a 'Networking' directory that contains the API service.

There's also a 'Common' directory at the same level that 'Modules', that contains the shared resources between the modules such as 'GenericCell' and a UIView extension.

## Unit Tests
The project has unit tests for each module. The tests are located in the `NewsMobileAppTests` directory.
The tests coverage is 84.3%.

## Adittional Notes
The project has a branch called 'wip/published-protocol'. This is a work in progress branch that aims to implement a protocol to reuse the friends' list and the news list. The idea is to create a protocol that defines the properties and methods that the viewModels should have, and then make two different viewModels to conform to this protocol, each one for each list.
This way, the ViewController can be reused and the code can be more organized. Eventhough it was cancelled, the work is only missing one function so far on the viewModel's protocol: `search(searchText: String)`, which allows the view to search in the list.

This idea was taking too much time of research and implementation, so I decided to leave it in a separate branch and focus on the main features of the project. Because the project is small, the reuse of the ViewController is not a priority, but it is a good practice to implement it.

The code in this branch was based on the following article: [Publishing Updates Using Protocols with Combine on iOS](https://www.kiloloco.com/articles/013-published-protocols-with-combine-on-ios/).

The branch still has some commented code (some of it is wrong) and some code that is not working properly. It is not ready to run.

## References
Links that helped me during the development of the project:
- https://developers.google.com/codelabs/maps-platform/maps-platform-101-swift?hl=es-419#0
- https://stackoverflow.com/questions/76792138/sandbox-bash72986-deny1-file-write-data-users-xxx-ios-pods-resources-to-co
