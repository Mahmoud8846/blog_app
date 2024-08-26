# README

 Blog Application API Documentation

This is the API documentation for the Blog Application. The application allows users to sign up, log in, create, update, and delete posts and comments,You can fine a ERD also attached in the root directory with name Blog App ERD.

I did a Web view for the whole application but both api requests and web view works ,you can test with whatever you want ,links for web pages are in the far bottom

## Table of Contents
- [Getting Started](#getting-started)
- [Authentication](#authentication)
  - [Sign Up](#sign-up)
  - [Login](#login)
- [Posts API](#posts-api)
  - [Create a Post](#create-a-post)
  - [Update a Post](#update-a-post)
  - [Delete a Post](#delete-a-post)
- [Comments API](#comments-api)
  - [Create a Comment](#create-a-comment)
  - [Update a Comment](#update-a-comment)
  - [Delete a Comment](#delete-a-comment)
- [Dependencies](#dependencies)

## Getting Started

To interact with the API, you need to set up the application by following the steps below:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/blog_app.git
   cd blog_app

Install the dependencies:
bundle install
Set up the database:
rails db:create
rails db:migrate
rails db:seed
Run the server:
rails server




3.Authentication
   Sign Up
Endpoint: POST /signup
Description: Creates a new user account.
Request:
URL: http://localhost:3000/signup
Method: POST
Body:{
  "user": {
    "name": "Ahmed Mohamed",
    "email": "ahmed@example.com",
    "password": "12456",
    "password_confirmation": "123456",
    "image": "path_to_image"
    //You should do body as form data to be able to attach the image file or sign up wouldn't work
  }
}

there is an account that is already signed up in case you needed it email:firstuser@email.com password 123456
Login
Endpoint: POST /login
Description: Authenticates a user and returns a token.
Request:
URL: http://localhost:3000/login
Method: POST
Body:{
  "email": "ahmed@example.com",
  "password": "123456"
}

Create a Post
Endpoint: POST /posts
Description: Creates a new post.
Request:
URL: http://localhost:3000/posts
Method: POST
Headers:
Authorization: Bearer <your_token_here>
Body:{
  "post": {
    "title": "My First Post",
    "body": "This is the body of my first post.",
    "tag_list": "tag1,tag2"
  }
}



Update a Post
Endpoint: PUT /posts/:id
Description: Updates an existing post.
Request:
URL: http://localhost:3000/posts/:id
Method: PUT
Headers:
Authorization: Bearer <your_token_here>
Body:{
  "post": {
    "title": "Updated Title",
    "body": "Updated body of the post.",
    "tag_list": "tag1,tag2"
  }
}




Delete a Post
Endpoint: DELETE /posts/:id
Description: Deletes a post.
Request:
URL: http://localhost:3000/posts/:id
Method: DELETE
Headers:
Authorization: Bearer <your_token_here>



Comments API



Create a Comment
Endpoint: POST /posts/:post_id/comments
Description: Creates a new comment on a specific post.
Request:
URL: http://localhost:3000/posts/:post_id/comments
Method: POST
Headers:
Authorization: Bearer <your_token_here>
Body:
{
  "comment": {
    "body": "This is a comment on the post."
  }
}



Update a Comment
Endpoint: PUT /posts/:post_id/comments/:id
Description: Updates an existing comment.
Request:
URL: http://localhost:3000/posts/:post_id/comments/:id
Method: PUT
Headers:
Authorization: Bearer <your_token_here>
Body:{
  "comment": {
    "body": "Updated comment text."
  }
}



Delete a Comment
Endpoint: DELETE /posts/:post_id/comments/:id
Description: Deletes a comment from a specific post.
Request:
URL: http://localhost:3000/posts/:post_id/comments/:id
Method: DELETE
Headers:
Authorization: Bearer <your_token_here>



Dependencies
Ruby: 3.2.0
Rails: 7.2.1
PostgreSQL: 15
Redis: 7.0
Sidekiq: For background job processing



Running the Application
To run the application using Docker:

Build and start the containers:
docker-compose up --build

Migrate and seed the database:

docker-compose exec web bundle exec rails db:migrate
docker-compose exec web bundle exec rails db:seed


The application will be running at http://localhost:3000
login page is at http://localhost:3000/login
signup page is at http://localhost:3000/signup
profile page is at http://localhost:3000/home/profile
home page is at http://localhost:3000/home/homepage






