unless Post.any? 
    Post.create!(title: 'How to create a GraphQL Blog with Rails',
            body: Faker::Lorem.paragraph) 

    Post.create!(title: 'How to create a proyect with React JS',
            body: Faker::Lorem.paragraph)
    puts "two posts created"
end


