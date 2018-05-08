# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Search.destroy_all
User.destroy_all

uno = User.create( name: 'Tony' )
unouno = User.create( name: 'Maria' )

one = Search.create( song_name: "Knives Out", artist: "Radiohead" , user_id: User.first.id)
two = Search.create( song_name: "Fly or Die", artist: "N.E.R.D" , user_id: User.first.id)

oneone = Search.create( song_name: "Knives Out", artist: "Radiohead" , user_id: User.second.id)
twotwo = Search.create( song_name: "Fly or Die", artist: "N.E.R.D" , user_id: User.second.id)

convo = Conversation.create

part = Participant.create( user_id: User.first.id , conversation_id: Conversation.first.id )
parpart = Participant.create( user_id: User.second.id , conversation_id: Conversation.first.id )








three = Message.create(user_id: User.first.id , conversation_id: Conversation.first.id , content: "Hello Maria")
threethree = Message.create(user_id: User.second.id , conversation_id: Conversation.first.id , content: "Hello Tony")
