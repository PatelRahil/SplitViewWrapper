# SplitViewWrapper

A SwiftUI implementation UIKit's UISplitView that manages all of the dataflow necessary for a basic Split View.

## Getting Started

This is a framework, so click [here](https://developer.apple.com/library/archive/technotes/tn2435/_index.html) for instructions on how to embed a framework in your app.

### Functionalities
Pass in a data model with an array of a data type, along with a template for the the list item and a template for the details view to get a view with
* A "master" view that is a scrollable table (List in SwiftUI) with the custom list item template
* A custom "detail" view that instantly reflects whichever item in the "master" view is selected
* A search bar for filtering the items in the "master" view

### Requirements for this framework
**Important: Make sure you** `import SwiftViewWrapper` **in your data model and custom master & detail view files**
SplitViewWrapper is useful for anyone looking for a basic implementation of a UISplitView with very easy usabilty and a very fast setup.
For your app to be able to use this framework effectively, it must have
1.  A data type that is
  * **Identifable**: protocol introduced with SwiftUI ([here](https://developer.apple.com/documentation/swiftui/identifiable) for documentation)
  * **Searchable**: protocol within the framework ([here](./SplitViewWrapper/Protocols/Searchable.swift)) that only requires a gettable string that can be used for searching (this will hopefully be optional in the future)
### Example:
```
struct Person: Identifiable, Searchable {
    var _id: String // some random id from a database
    var name: String
    var birthdate: String
    
    var id: String { // satisfies Identifiable protocol
        _id
    }
    var searchableText: String { // satisfies Searchable
        get { name }
    }
}
```
    
2.  A data model that conforms to `SplitViewDataSource` ([here](./SplitViewWrapper/Protocols/SplitViewDataSource.swift)), which requires
  * an array of the same aforementioned data type (this isn't really necessary anymore, but I need to refactor to remove this requirement)
  * a function called `download` that has two callback parameters, one of which takes an array of the aforementioned data type, and the other of which takes a `String` (for errors)
### Example:
```
class PeopleDataModel {
    var people: [Person] = []
    func downloadData(success: @escaping ([Customer]) -> (), fail: @escaping (String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            let people = [
                Person(_id: "0", name: "John Doe", birthdate: "January 1, 1980"),
                Person(_id: "1", name: "Mary Doe", birthdate: "December 31, 1990")
            ]
            self.people = people
            success(people)
        }
        if ("yes" == "no") {
            fail("This will never happen.")
        }
    }
}
```
3. A custom list view that conforms to `SplitViewListItemProtocol` ([here](./SplitViewWrapper/Protocols/SplitViewListItemProtocol.swift) in respository), which requires
  * a variable `data` of the same aforementioned (`Optional`)  data type
  * conforms to `View` (from SwiftUI, [here](https://developer.apple.com/documentation/swiftui/view) for documentation)
### Example:
```
struct PersonListViewItem: SplitViewListItemProtocol {
    var data: Person? // <-- "Optional" Person
    var body: some View {
        ZStack {
            Text(data == nil ? "Loading" ? "")
            HStack {
                Text(data == nil ? "" : data!.name).padding()
                Spacer()
                Text(data == nil ? "" : data!.birthdate).padding()
            }
        }
    }
}
```
4. A custom detail view that conforms to `SplitViewDetailProtocol` ([here](./SplitViewWrapper/Protocols/SplitViewDetailProtocol.swift) in repository), which has 
the exact same requirements as `SplitViewListItemProtocol`.
### Example:
```
struct PersonDetailView: SplitViewDetailProtocol {
    var data: Person? // <-- "Optional" Person
    var body: some View {
        ZStack {
            Text(data == nil ? "Loading" ? "")
            Text(data == nil ? "" : "\(data!.name) is selected, and his birthday is on \(data!.birthdate)!")
        }
    }
}
```
### Using the previous 4 items to create the SplitViewWrapper
1. Create a `SplitViewWrapperData` object with the four items. 
**Note: Sometimes weird errors may pop up, but they can usually be resolved by explicitly stating types.**
### Example:
```
    let peopleDataModel = PeopleDataModel()
    let personWrapperData = SplitViewWrapperData<PeopleDataModel, PersonListViewItem, PersonDetailView>(dataSource: peopleDataModel, splitViewModel: SplitViewModel<PersonListViewItem, PersonDetailView>(listTemplate: PersonListViewItem(), detailTemplate: PersonDetailView()))
```
2. Pass the wrapper data into an instance of `SplitViewWrapper` inside of a view's body.
### Example:
```
struct ContentView: View {
    var body: some View {
        let peopleDataModel = PeopleDataModel()
        let personWrapperData = SplitViewWrapperData<PeopleDataModel, PersonListViewItem, PersonDetailView>(dataSource: peopleDataModel, splitViewModel: SplitViewModel<PersonListViewItem, PersonDetailView>(listTemplate: PersonListViewItem(), detailTemplate: PersonDetailView()))
        return SplitViewWrapper(wrapperData: personWrapperData)
    }
}
```
__*Notice that using this framework does not require the programmer to create any BindableObject's, @EnvirontmentObject's, @ObjectBinding's, or @State's.*__


**Note: The examples did not show it, but this framework can handle data being updated asynchronously. Unfortunately, currently, if data is changed, the view needs to be re-rendered to reflect the changes. Also, if the List scrolls very slowly initially, or is very laggy, try passing the data into the**`success`**callback of the**`download`**function at intervals (i.e. every 100 objects).**

## Built With

* [SplitView](https://github.com/a2/SplitView) - A generic implementation of `UISplitView` with a `UIHostingController` for `SwiftUI`

## Authors

* **Rahil Patel** - *Initial work* - [Github](https://github.com/PatelRahil)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
