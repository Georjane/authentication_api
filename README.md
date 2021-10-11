
# Redux - Hotels & Resorts RoR RESTful API 
## Project Description

This project is a Final capstone based on a find your house app. It specifically helps the user to find vacation hotels and resorts.

## RESTful API
A RESTful API to manage database resources. The api has the following endpoints;
| Enpoints            | Fuctionality   |
| ------------------- | -------------- |
| POST registration/  | Sign up        |
| POST sessions/      | Sign in        |
| POST hotels/        | Add hotel      |
| GET hotels/         | List hotels    |
| POST favorites/     | Add favorite   |
| GET favorites/      | List favorites |
| DELETE logout/      | Logs out User  |

## Technical requirements of the Front End Project
1. The project is a mobile web app which is responsive on desktop too
2. The database has 3 tables, users, hotels, favorites table using Postgres as the DB
3. It Connects to the back-end API to send and receive domain data. With routes for each of the screens, so the user can easily go back and forward, Using redux to store info used across the app, like the user info

## Project Structure
– The App page is a container with React Router. It gets app state from Redux Store. Then the navbar now can display based on the state.

– Login & Register pages have form for data submission (with support of react-validation library). They dispatch auth actions (login/register) to Redux Thunk Middleware which uses apiMiddleware to call API.

– apiMiddleware methods use axios to make HTTP requests.

– Home page is public for all users.

– Hotels page displays a list of hotel & resorts information after the login action is successful.

- When a user selects a hotel, detailed information about the hotel is presented and the possibility to add it to favourites. The user can access a list of favourite hotels

## Redux - Hotels & Resorts RoR RESTful API Screenshot
![Redux - Hotels & Resorts](https://user-images.githubusercontent.com/60772732/133516851-33c8472f-44d3-4a75-b9ba-6f7ce2e38987.png)

## Live Link on Netlify
- [Redux - Hotels & Resorts RoR RESTful API](https://keen-fermat-a31782.netlify.app)


## Front End Repo Link
- [Front End Repo Link](https://github.com/Georjane/redux_hotels_and_resorts)

## Tools used
- ROR
- Ruby
- TDD
- RSpec
- Heroku

## Getting Started
To get a local copy of the repository please run the following commands on your terminal:
```
$ git clone https://github.com/Georjane/authentication_api.git
$ cd authentication_api
$ rails db:migrate
$ rails s
$ Open localhost:3000 in your browser if it doesn't open automatically
```

## Run Tests
```
$ bundle exec rspec
```

## Author

### 1. Witah Georjane
* Github: [@Georjane](https://github.com/Georjane)
* Twitter: [@WittyJany](https://twitter.com/WittyJany)
* LinkedIn: [Witah Georjane](https://www.linkedin.com/in/witah-georjane)

## Contributing
There are two ways of contributing to this project:

1. If you see something wrong or not working, please open the issue in issue section
2. If you see something to improve or to correct, and you have a solution to that, follow the below steps to contribute:
    1. Fork this repository
    2. Clone it on your local computer by running `git clone https://github.com/Georjane/authentication_api.git` __Replace *your username* with the username you use on github__
    3. Open the cloned repository which appears as a folder on your local computer with your favorite code editor
    4. Create a separate branch off the *master branch*,
    5. Write your codes which fix the issue you found
    6. Commit and push the branch you created
    7. Open a pull request, comparing your new created branch with our original master branch [here](https://github.com/Georjane/authentication_api/pulls)

## Show your support

Give a ⭐️ if you like this project!

## Design Inspiration
- All design inspiration info can be found [here](https://www.behance.net/gallery/37706679/Circle-(Landing-page-Dashboard-Mobile-App))

## Acknowledgment
* [Microverse](https://www.microvese.org)
* Design idea by [Alexey Savitskiy on Behance](https://www.behance.net/alexey_savitskiy)
