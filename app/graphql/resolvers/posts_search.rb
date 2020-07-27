require 'search_object'
require 'search_object/plugin/graphql'


class Resolvers::PostsSearch 
    # include SearchObject for GraphQL 
    include SearchObject.module(:graphql)

    type [Types::PostType],null: true 

    #scope is starting point for seach
    scope { Post.all }

    class PostFilter < ::Types::BaseInputObject 
        argument :OR, [self], required: false 
        argument :title_contains, String, required: false 
        argument :content_contains, String, required: false 
    end

    option :filter, type: PostFilter, with: :apply_filter

    def apply_filter(scope,value)
        branches = normalize_filters(value).reduce { |a, b| a.or(b)}
        scope.merge branches 
    end

    def normalize_filters(value, branches = [])
        scope = Post.all 
        scope = scope.where('title LIKE ?',"%#{value[:title_contains]}%") if value[:title_contains]
        scope = scope.where('content LIKE ?',"%#{value[:content_contains]}%") if value[:content_contains]

        branches << scope 

        value[:OR].reduce(branches) { |s,v| normalize_filters(v,s)} if value[:OR].present? 

        branches 
    end

end