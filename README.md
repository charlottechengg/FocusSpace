# FocusSpace :trophy: ElleHacks2022 - (Telus) First Place 

## :woman: Developers
Charlotte Cheng(@charlottechengg), Senni Tan(@senni0418)

## :star: Inspiration
The covid pandemic significantly changed our lifestyle, with the majority of our work transition to online. People in our community face a slew of new challenges due to the pandemic situation. Procrastination, diminished collaboration, and overworking have emerged as challenges. Study shows that remote employees work longer hours and spend more time communicating. Approximately 70% of remote professionals now work on weekends, and 45% regularly work more hours during the week than they had before.


## :iphone: What it does
It is an innovative iOS app to help the community beat procrastination and focus with friends. It also encourages people to take some rest during their work, helping remote employees to disconnect from their work.
![combined-view](https://user-images.githubusercontent.com/59659987/153794258-aed55989-f277-483a-b95a-709f7a1d32fc.png)

## :computer: How we built it
We use Swift 5 to build our solution in an iOS Xcode project. We use cockroachDB to host our database. We used the MVC pattern to implement the application. All of the views are in SwiftUI, and it is iOS compatible.
## :hourglass: Challenges we ran into

Most of the challenges come from learning new things, we are all beginners to SwiftUI and iOS development aside from an online tutorial. Second, we had never tried to connect the Xcode project to a cloud database before, so we had read lots of articles on connecting cloud Postgres databases in swift. Third, we had never used SwiftUI before, both of us only have experience with Xcode in storyboard. Moreover, the data flow in Swift is difficult and confusing for us, so it took a really long time to just debug why a variable wasn’t 
binding as expected.

## :memo: Accomplishments that we're proud of
We were able to create an iOS app from scratch that uses SwiftUI and cockroachDB with just the two of us. We learned lots of new skills during this hackathon.

<img width="801" alt="Screen Shot 2022-02-13 at 03 48 26" src="https://user-images.githubusercontent.com/59659987/153792847-c5c21f68-533f-49a0-aa37-937a659e22b2.png">

## :mortar_board: What we learned
We learned a lot of SwiftUI and also how to integrate CockroachDB, chart seamlessly into our iOS application. 
## :mag: What's next for FocusSpace
We would like to improve the application performance and user experience. We plan to integrate google sign in with our login view. As the amount of users grows, we will separate the storage of user authentication information and the user activity log. We will store users’ authentication info in firebase to have safer protection for users’ credentials. And the user’s activity log will be kept in cockroachDB since it is a well scalable cluster database service. We are considering adding charting functionality for users to communicate in the virtual room. We can also add different themes for the app interface and the piechart.

<img width="809" alt="Screen Shot 2022-02-13 at 03 48 38" src="https://user-images.githubusercontent.com/59659987/153792869-e4f77994-6811-4c94-96a8-e7163d1f7c2b.png">



