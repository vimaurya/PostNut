# PostNut

This repository contains a Java web application that allows users to create, delete, and comment on posts. The application is built using JSP (JavaServer Pages) for server-side rendering and Servlets to handle HTTP requests and responses.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup](#setup)
- [Usage](#usage)
- [Database](#database)
  
## Features

1. **User Registration and Login**: Users can register and log in to the application using their email and password.
2. **Create Post**: Logged-in users can create new posts with a title and content.
3. **Delete Post**: Users can delete their own posts.
4. **Comment on Posts**: Users can comment on any post.
5. **View Posts**: Users can view all posts, including the ones posted by others.

## Technologies Used

- Java
- JSP (JavaServer Pages)
- Servlets
- MySQL
- HTML/CSS

## Setup

To run the application locally, follow these steps:

1. Clone the repository: `git clone <repository_url>`
2. Install Java, MySQL, and a Servlet container (e.g., Apache Tomcat) on your system if not already installed.
3. Create a MySQL database and update the database configuration.
4. Build the project and deploy it to the Servlet container.

## Usage

1. Open your web browser and go to `http://localhost:<port>/` where `<port>` is the port number used by your Servlet container (usually 8080).
2. Register a new user or log in if you already have an account.
3. Once logged in, you will be redirected to the dashboard where you can see all posts.
4. To create a new post, click on the "Create Post" button and fill in the title and content.
5. To delete your own post, click on the "Delete Post" button next to the post you want to delete.
6. To comment on a post, click on the "Comment" button and enter your comment in the input field.

## Database

The application uses a MySQL database to store user information, posts, and comments. The database schema consists of the following tables:

1. `users`: Stores user information (email, password).
2. `posts`: Stores post information (id, title, content, author_id, timestamp).
3. `comments`: Stores comment information (id, content, post_id, author_id, timestamp).
