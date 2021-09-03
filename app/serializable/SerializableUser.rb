class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email
  attributes :username
  attributes :firstname
  attributes :lastname
  attributes :created_at

  link :self do
    @url_helpers.api_user_url(@object.id)
  end
end