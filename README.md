# FocusSpace
## Inspiration
The covid pandemic changed our lifestyle with most of our things going online. People in our community face many new challenges due to doing things from home. For example, procrastination problems from working at home.
## What it does
It is an innovative app to help the community beat procrastination and focus with friends. It also encourages people to take some rest during their work, helping remote employees to disconnect from their work
## How we built it
We use Swift 5 to build our solution in an iOS Xcode project. We use cockroachDB to host our database. We used the MVC pattern to implement the application. All of the views are in SwiftUI, and it is iOS compatible.
## Challenges we ran into
Most of the challenges come from learning new things, we are all beginners to SwiftUI and iOS development aside from an online tutorial. Second, we had never tried to connect the Xcode project to a cloud database before, so we had read lots of articles on connecting cloud Postgres databases in swift. Third, we had never used SwiftUI before, both of us only have experience with Xcode in storyboard. Moreover, the data flow in Swift is difficult and confusing for us, so it took a really long time to just debug why a variable wasn’t binding as expected.
## Accomplishments that we're proud of
We were able to create an iOS app from scratch that uses SwiftUI and cockroachDB with just the two of us. We learned lots of new skills during this hackathon.
## What we learned
We learned a lot of SwiftUI and also how to integrate CockroachDB, chart seamlessly into our iOS application. 
## What's next for FocusSpace
We would like to improve the application performance and user experience. We plan to integrate google sign in with our login view. As the amount of users grows, we will separate the storage of user authentication information and the user activity log. We will store users’ authentication info in firebase to have safer protection for users’ credentials. And the user’s activity log will be kept in cockroachDB since it is a well scalable cluster database service. We are considering adding charting functionality for users to communicate in the virtual room. We can also add different themes for the app interface and the piechart.
