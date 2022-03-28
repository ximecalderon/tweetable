# **Team - Tweetable**
## **The challenge**

Your team has 3 days to build an MVP of **Tweetable** app, a simpler version of Twitter.

![tweetable preview](/preview.png)

This version consists of 3 entities as the following ERD:

![database model](https://p-vvf5mjm.t4.n0.cdn.getcloudapp.com/items/04uxNzGO/14ac68af-2e0a-4069-a594-e6ae6f7aaee7.jpg?source=viewer&v=bfb325cf66e4810e11a9f308f0737407)

The field **'password'** on the User model could be **'password_digest'** or **'encrypted_password'** depending on the authentication system your team would use (Bcrypt or Devise). Any additional fields could be added to support the requirements (for example **'provider'**, **'uid'**, **'token'**...)

## Associations

- A **'User'** could have many **'Tweets'**
- A **'Tweet'** belongs to a **'User'**
- A **'User'** could like many **'Tweets'**
- A **'Tweet'** could be liked by many **'Users'**
- A **'Tweet'** could be a reply to another **'Tweet'**
- A **'Tweet'** could have many **'replies'**

## Validations

### User

- **'email'** cannot be blank, should have an **'email'** format and be unique
- **'username'** cannot be blank and should be unique
- **'name'** cannot be blank
- **'avatar'** If the user doesn't provide an image, a placeholder image should be used by default.
- **'password'** should be at least 6 characters long
- **'role'** could be **'0'** → **'member'** or **1** → **'admin'**. By default, the role is 'member'

### Tweet

- **'body'** cannot be blank and should be at most 140 characters long
- **'replies_count'** starts at 0 by default
- **'likes_count'** starts at 0 by default
- **'replied_to'** is not required but it should be a valid Tweet id

### Like

- **'user_id'** and **'tweet_id'** should be a unique combination

## Authentication/Authorization

Only members can create, edit and destroy their own Tweets and create and destroy their own Likes.

Not logged users can only read the list of Tweets, the tweet details, and user profiles.

Admins can perform all CRUD operations.

You can use any tool that allows authentication with **'email'** and password.

You should include authentication with 1 external provider using OAuth (Github recommended)

## API interface

**Tweetable** should include an API interface to interact with the application.

- All the features supported by the graphical interface should be supported by the API.
- Use a token strategy to authenticate users on the API.
- Implement all the endpoints in an Insomnia workspace and export them to a JSON file. Include this JSON file in your project.
- All endpoints should be tested using Rspec Requests specs.

## Seed

Your project should include seed that:

- Create 1 **'admin'** user with **'email'** admin@mail.com and password **'supersecret'**
- Create 4 member users
- Each member should create some tweets
- Each member should reply to some other tweets
- Each member should like some tweets

## Resources

Figma Design: [here](https://www.figma.com/file/B7aydkPtCKfmlP8HxwwXng/C4-Tweetable?node-id=888%3A708).