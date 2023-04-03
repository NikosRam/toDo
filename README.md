
# A Simple FullStack Application

This is a simple fullStack application which showcases the use of Node.js to define endpoints to perform the basic operations of authentication as well as fetching, creating and deleting entries from and to the Database.

Main Focus was given to the Backend.

Check the corresponding Backend package in the Repository.

## Frontend

- Flutter SDK
- Dart

## Backend

- Node.js
- MongoDB

## Main Endpoints

- http://127.0.0.1:8000/api/v1/users/signup POST
- http://127.0.0.1:8000/api/v1/users/login POST
- http://127.0.0.1:8000/api/v1/todo/ GET
- http://127.0.0.1:8000/api/v1/todo/ POST
- http://127.0.0.1:8000/api/v1/todo/:id DELETE

### Those requests are triggered through interaction with the app.

- The Login and Signup buttons trigger the corresponding requests.
- The get request for fetching all the user's todos is triggered in initState when the todos overview screen is loaded.
- The delete IconButton on the right hand side of the ToDo Tile sends a delete request for the specific todo and is therefore also removed instantly from the UI.
- A new ToDo is created when filling the ToDo title and submitting the Form from the Add new ToDo Screen.

## Lessons Learned

This simple fullstack project is enough for somebody to understand RESTful APIs thoroughly.
With the knowledge acquired, someone can very easily go on to learn other backend technologies such as Laravel, Ruby On Rails or Spring.


## Future Implementations

- Better Error Handling in the Frontend

- Work on the User Interface and enhance the user experience.

- Implementation of some already defined but never used endpoints in the Frontend.

- Add Completed ToDo functionality to the Frontend

- Add Edit ToDo functionality to the Frontend

- Etc..

