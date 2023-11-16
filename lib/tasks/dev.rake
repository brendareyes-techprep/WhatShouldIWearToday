unless Rails.env.production?
  namespace :dev do

    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Fill the database tables with some sample data"
    task sample_data: :environment do
      usernames = [
        "brenda",
        "carman",
        "jun",
        "andre"
      ]
      usernames.each do |username|
        User.create(
          email: "#{username}@example.com",
          password: "password",
          username: username.downcase
        )
      end
    end

  end
end
