
# graphql-ruby-blog

## This Proyect has the following features: 

- authentication system 
- users can create, read, update and delete blogs 
- users can save the blog of other user to favorites 
- users can comment the blog of other user 
- users can clap the blog of other user 
- users can comment the blog of other user 

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
      password: "123456"
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
      password: "123456"
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

