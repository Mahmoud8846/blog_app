JWT_SECRET_KEY = Rails.application.credentials.jwt_secret || ENV['JWT_SECRET_KEY'] || 'nrevoiurhgu@e9er4%35$967347@rey$e54'

def encode_token(payload)
  JWT.encode(payload, JWT_SECRET_KEY)
end

def decode_token(token)
  begin
    decoded = JWT.decode(token, JWT_SECRET_KEY, true, algorithm: 'HS256')
    decoded[0] 
  rescue JWT::DecodeError
    nil 
  end
end