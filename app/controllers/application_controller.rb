class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end



# <%= form_for :user, url: '/signin', method: :post do |f| %>

#   User: <%= f.collection_select(:name, User.all, :name, :name) %>
#   Password: <%= f.password_field :password %>
#   <%= f.submit "Sign In" %>
# <% end %>