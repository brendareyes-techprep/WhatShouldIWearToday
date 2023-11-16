desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase
    )
  end
    
end
