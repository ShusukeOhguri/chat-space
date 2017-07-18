json.array! @messages do |message|
  json.user_name      message.user.name
  json.created_at     message.created_at
  json.text           message.text
  json.image          message.image
  json.message_id     message.id
end
