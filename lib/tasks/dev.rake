unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to the database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ] do
      puts "Done resetting database with sample data"
    end

    desc "Adds sample data for the development environment"
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_items",
      "dev:add_outfits",
      "dev:add_outfit_items"
    ] do
      puts "Done adding sample data"
    end

    desc "Fill the database tables with some sample data"
    task add_users: :environment do
      usernames = ["brenda", "carman", "jun", "andre"]

      usernames.each do |username|
        User.create(
          email: "#{username}@example.com",
          password: "password",
          username: username.downcase
        )
        puts "Added #{username}@example.com"
      end
    end

    task add_items: :environment do
      puts "Adding items..."
      items_data = [
        { color_hex: "#808080", details: "grey long sleeve", photo_url: "https://media.everlane.com/image/upload/c_fill,dpr_2,f_auto,g_face:center,q_auto,w_auto/v1/i/8b73dbe4_6e1c.jpg" },
        { color_hex: "#0000FF", details: "blue pants", photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyMC_CiATe4mkYZgKMOUdv0JTmOWJ49ZDDwQ&usqp=CAU" },
        { color_hex: "#00FF00", details: "green shoes", photo_url: "https://m.media-amazon.com/images/I/5194VX4TWwL._AC_UY1000_.jpg" }
      ]

      User.all.each do |user|
        items_data.each do |item_data|
          user.items.create!(item_data)
          puts "Added items for user #{user.email}: #{item_data[:details]}"
        end
      end

      puts "Done"
    end

    task add_outfits: :environment do
      puts "Adding outfits.."
      outfits_data = [
        { photo_url: "https://cdn.lookastic.com/looks/blazer-sweatshirt-long-sleeve-shirt-large-99583.jpg" },
        { photo_url: "https://i.pinimg.com/474x/92/04/b3/9204b3ee5d0202fe84c9c062ed16dffc.jpg" },
        { photo_url: "https://cdn.lookastic.com/looks/long-sleeve-shirt-chinos-tassel-loafers-large-18404.jpg" }
      ]
      User.all.each do |user|
        user.outfits.create!
        puts "Added outfit for user #{user.email}"
      end

      puts "Done"
    end

    task add_outfit_items: :environment do
      puts "Adding outfit items..."
      User.all.each do |user|
        user.outfits.each do |outfit|
          items_in_outfit = user.items.sample(rand(1..3))

          items_in_outfit.each do |item|
            outfit.outfit_items.create!(item: item)
            puts "Added item #{item.details} to outfit for user #{user.email}"
          end
        end
      end

      puts "Done"
    end
  end
end
