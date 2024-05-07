# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require
# app.rb

require 'date'
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/calendar_displayer'
require_relative 'lib/date_parser'

# Création d'utilisateurs
julie = User.new("julie@email.com", 32)
jean = User.new("jean@email.com", 28)

# Méthode pour créer un événement
def create_event(users)
  puts "Entrez la date et l'heure de l'événement (format : YYYY-MM-DD HH:MM) :"
  event_datetime = gets.chomp
  puts "Entrez la durée de l'événement (en minutes) :"
  event_duration = gets.chomp.to_i
  puts "Entrez le titre de l'événement :"
  event_title = gets.chomp

  Event.new(event_datetime, event_duration, event_title, users.map(&:email))
end

# Création d'un tableau pour stocker les événements
events = []

# Boucle pour créer plusieurs événements
loop do
  events << create_event([julie, jean])

  puts "Voulez-vous ajouter un autre événement ? (O/N)"
  response = gets.chomp.downcase
  break unless response == 'o'
end

# Affichage de tous les utilisateurs
puts "Liste des utilisateurs :"
User.all.each do |user|
  puts "Email : #{user.email}, Age : #{user.age}"
end

# Affichage de chaque événement
events.each_with_index do |event, index|
  puts "Détails de l'événement #{index + 1}:"
  puts event.to_s
end

# Affichage du calendrier
calendar_displayer = CalendarDisplayer.new(events)
calendar_displayer.display_month(2024, 1) # Affiche le calendrier pour janvier 2024

