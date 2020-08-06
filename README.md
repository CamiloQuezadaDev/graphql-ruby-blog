
# Graphql Ruby Blog  <img src="https://cloud.githubusercontent.com/assets/2231765/9094460/cb43861e-3b66-11e5-9fbf-71066ff3ab13.png" height="40" alt="graphql-ruby"/>
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/for-you.svg)](https://forthebadge.com)

&nbsp;

## Table of contents: 
* [Proyect features](#proyect-features) 
* [Proyect Installation](#proyect-installation) 
* [Interesting Files](#interesting-files) 
  * [Root files](#root-files) 
  * [Record types](#record-types)
  * [Mutations](#mutations)
  * [Sample GraphQL Queries](#simple-queries)
* [Inspiration](#inspiration) 

  
  
  
&nbsp;


## <a name="proyect-features"></a> This Proyect has the following features: 

- [x] authentication system 
- [x] users can create, read, update and delete blogs
- [x] users can comment the blog of other user
- [x] users can clap the blog of other user
- [x] users can save the blog of other user to favorites 

&nbsp;

## <a name="proyect-installation"></a> Installation

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

&nbsp;
 
## <a name="interesting-files"></a> Interesting Files: 

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

- [AddComment](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/add_comment.rb)  -  mutation
- [AddClap](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/add_clap.rb)  -  mutation

- [AddFavorite](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/add_favorite.rb)  -  mutation
- [DeleteFavorite](https://github.com/CamiloQuezadaDev/graphql-ruby-blog/blob/master/app/graphql/mutations/delete_favorite.rb)  -  mutation

&nbsp;

## <a name="simple-queries"></a> Sample GraphQL Queries

Sign Up:

```graphql
mutation {
  signUp(input: { name: "Leonardo da Vinci", credentials: { email: "leonardo@example.com", password: "leonardo123" } } ) {
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
  signIn(input: { credentials: { email: "leonardo@example.com", password: "leonardo123" } }) {
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
  createPost(input: { title:"How to create a GraphQL Blog with Rails", body:"Vitae eaque dolor. Et amet laudantium. Molestiae velit quos." }) {
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
  updatePost(input: { id:"1", title:"How to create a React App", body:"Vitae eaque dolor. Et amet laudantium. Molestiae velit quos."}) {
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
  destroyPost(input: { id:"1"}) {
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

Add Comment: 
```graphql
mutation {
  addComment(input: { postId:"1", content:"I love your Post"} ) {
  comment {
    id 
    content
    commentedBy {
      id
      name
    }
  }
    errors
    success
  }
}
```

Add Clap

```graphql
mutation {
  addClap(input: {postId:"3"}){
    clap {
      clappedBy {
        name
      }
    }
    success
    errors
  }
}
```

Add Favorite

```graphql
mutation {
  addFavorite(input: {postId:"3"}){
    favorite {
      title
    }
    success
    errors
  }
}
```

Delete Favorite

```graphql
mutation {
  deleteFavorite(input: {postId:"3"}){
    favorite {
      title
    }
    errors
    deleted
  }
}
```

&nbsp;

## <a name="inspiration"></a> Inspiration 

This sample app is based on graphql-ruby tutorial from howtographql

&nbsp; 

Lookin' at the source code huh?
Be sure to drop me a line! I'd love to chat, whether it's about code, design, sports, coffee, books, or anything in between. 👨🏻‍💻☕️
