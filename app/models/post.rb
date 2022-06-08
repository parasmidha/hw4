class Post < ApplicationRecord
    #Adding the functionality to input the image uploaded by user while creating the post
    has_one_attached :uploaded_image
end