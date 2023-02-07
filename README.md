# Birthday-App

Birthday App is a small app that allows you to keep track of birthdays.

When you open the app, you'll be able to see a list of peoples birthdays in order.
You will also be able to view a person and it will also tell you how old they are (or will be).

Installation: 

Clone the project
Run BirthdayApp.xcodeproj in Xcode
Choose simulator device and run the app

I avoided using any third-party libraries since:
- We don't have any complex UI components/Network request.
- When someone who is not from iOS profession wants to run the project doesn't need to bother with installing pods / SPM

Design patterns used is MVVM
Reason for this pattern is because it separates bussiness logic from vc and its mainteinable and testable.
When working with MVVM there is a problem with data binding between view model and view controller
In this case I haven't used reactive programming, If I did, I would use RxSwift or Combine for data binding.
There is also many different approaches with data binding if we don't use reactive programming.
My choice for that was a tiny wrapper class which wrapps any variable into Observable and gives you 2 attributes: 
Value - variable value
Bind - closure to bind on the value changing events

If I had more time I would:
- Write ordinary Unit tests for viewModels and repositories
- Format this readme file better
- Have fonts in my resources
- Be more carefull to details 

The project was built under 3 hours




