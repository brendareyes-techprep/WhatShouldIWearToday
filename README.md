## This is my code for my final project. **UPick**
# This is going to be your personal online closet. This will help you get ready in the morning faster, to optimize time, to allow you to be creative and think outside the box. You will be able to create and log your closet items. Once everything is logged you can start creating your items. All items will be listed on the outfits form, you can attach as well a photo url for the outfit vibe/inspiration, and a quick name/description for the outfit.
# Schemas
# Contact (this is for the contact me)
- email
- text
- created_at
- updated_at

# Items
- photo_url (this is the image, was originally supposed to be a url but i was able to implement cloudinary)
- color_hex (string)
- details (name of item)
- owner_id
- created_at
- updated_at

# Outfit_items (joint table)
- outfit_id
- item_id
- created_at
- updated_at

# Outfit
- owner_id
- created_at
- updated_at
- vibe (photo_url)
- name

# Users (devise)
- email
- username
- password
- created_at

# Additional information needed
- Cloudinary is used for photos, if needed API information is needed please contact me. 
