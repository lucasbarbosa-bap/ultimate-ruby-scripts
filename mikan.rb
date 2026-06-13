require 'sinatra'
require 'sinatra/reloader'
require 'json'

mockInicial = {
  'mikan_happy': '/mikan_happy.png',
  'mikan_shy': '/mikan_shy.webp',
  'mikan_envergonhada': 'mikan_envergonhada.png'
}

sprites = [
  {
    "id": 1,
    'path': '/mikan_happy.png',
  },
    {
    "id": 2,
    'path': '/mikan_envergonhada.webp',
  },
    {
    "id": 3,
    'path': '/mikan_shy.webp',
  }
]


get '/' do
    "MIKAN 💜"
end

get '/mikan/sprites' do
    "<img src='/mikan_happy.png' />"
end

get '/mikan/sprites/:id' do
    id = params[:id].to_i
    Id_sprite = sprites.find{|teste| id == teste[:id]}
    sprite = Id_sprite[:path]
       
    if sprite
      sprite
      "<img src='#{sprite}' />"
    else
      "sprite não encontrado" 
    end
end