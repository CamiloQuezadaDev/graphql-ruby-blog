
# graphql-ruby-blog

## This Proyect has the following features: 

 
- [x] authentication system 
- [x] users can create, read, update and delete blogs
- [x] users can comment the blog of other user 
- [ ] users can save the blog of other user to favorites 
- [ ] users can clap the blog of other user

## Installation

Install dependencies:

```
bundle install

rails db:setup
```

Starting the server:

```
rails server
```

Opening the application:

```
open http://localhost:3000/
```
or 
```
http://localhost:3000/graphiql
```
               
## Interesting Files: 

- [GraphqlController](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/controllers/graphql_controller.rb) - GraphQL controller (api entry point)
- [GraphqlTutorialSchema](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/graphql_ruby_blog_schema.rb) - the schema definition
- [Mutations](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/types/mutation_type.rb) - root mutations
- [Queries](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/types/query_type.rb) - root queries
- [UserType](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/types/user_type.rb) - record type
- [PostType](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/types/post_type.rb) - record type


- [SignIn](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/sign_in.rb)  -  mutation
- [SignUp](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/sign_up.rb)  -  mutation

- [CreatePost](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/create_post.rb)  -  mutation
- [UpdatePost](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/update_post.rb)  -  mutation
- [DeletePost](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/delete_post.rb)  -  mutation

## Sample GraphQL Queries

Sign Up:

```graphql
mutation {
  signUp(input: {
  	name: "Leonardo da Vinci",
    credentials: {
      email: "leonardo@example.com",
      password: "leonardo123"
    }
  } 
  ) {
    user {
      id 
      email 
      name
    }
    success
    errors
  }
}
```
Create new user token:
```graphql
mutation {
  signIn(input: {
    credentials: {
      email: "leonardo@example.com",
      password: "leonardo123"
    }
  } 
  ) {
    user {
      id 
      email 
      name
    }
  success
  token
  errors
  }
}
```
Create post:
```graphql
mutation {
  createPost(input: {
    title:"How to create a GraphQL Blog with Rails"
    body:"Vitae eaque dolor. Et amet laudantium. Molestiae velit quos."
  } 
  ) {
    post {
      id
      title
      content
      postedAt
      updatedAt 
      postedBy {
        name
      }
    }
  success
  errors
  }
}
```
Update post:
```graphql
mutation {
  updatePost(input: {
    id:"6"
    title:"How to create a React App"
    body:"Vitae eaque dolor. Et amet laudantium. Molestiae velit quos."
  } 
  ) {
    post {
      id
      title
      content
      postedAt
      updatedAt 
      postedBy {
        name
      }
    }
  updated
  errors
  }
}
```
Destroy post: 

```graphql
mutation {
  destroyPost(input: {
    id:"6"
  } 
  ) {
    post {
      id
      title
      content
      postedAt
      updatedAt 
      postedBy {
        name
      }
    }
  deleted
  errors
  }
}
```

Lookin' at the source code huh?
Be sure to drop me a line! I'd love to chat, whether it's about code, design, sports, coffee, books, or anything in between. 👨🏻‍💻☕️
