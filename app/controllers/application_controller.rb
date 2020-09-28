class ApplicationController < ActionController::API

    def index 
        render plain: "Hello World from Graphql-ruby-blog"
    end
end
