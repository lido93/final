# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :places do
  primary_key :id
  String :location
  String :description, text: true
  String :dates
  String :see
  String :eat
end
DB.create_table! :comments do
  primary_key :id
  foreign_key :place_id
  foreign_key :user_id
  String :comments, text: true
end
DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
end

# Insert initial (seed) data
places_table = DB.from(:places)

places_table.insert(location: "Hong Kong", 
                    description: "A city located off the coast of Southern China, Hong Kong has a complex history that makes it the most interesting blend of east and west. I studied abroad and lived here in Fall 2013. ",
                    dates: "August-December 2013",
                    see: "Victoria's Peak",
                    eat:"Maxim's Palace")

places_table.insert(location: "Alaska", 
                    description: "America's 49th state, Alaska does not border the continental US and in fact refers to it as the Lower 48. Alaska is known for it's beautiful landscapes and abundant wildlife. ",
                    dates: "June 2019",
                    see: "Denali National Park",
                    eat:"Tracy's King Crab Shack")
                    
places_table.insert(location: "Iceland", 
                    description: "A small island in the northern Atlantic ocean, I drove the famed Ring Road (around the entire island) in 4 days. Come here for incredible nature and plenty of waterfalls. ",
                    dates: "July 2018",
                    see: "Jökulsárlón",
                    eat:"Messinn")
