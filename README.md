# InTune 

### Connecting people who listen to the song

[Bun Times](https://buntimes.herokuapp.com/) is a proof of concept app and doesn't currently contain a complete or real dataset.

### Technologies Used
* *Ruby on Rails* - 
The Sinatra framework is simple, but allows for the creatation of websites that can be served dynamically with the help of Ruby. It allows for the collection and processing of user input to parsed to the database. The returns can then be parsed back to the user in the form of a website personalised for them.

* *Postgres* - 
This implementation of SQL was used to manage the app's database. It's relational structure easily allows tables to be connected for complex query requests.

* *ActiveRecord* - 
This Ruby gem provides ORM (Object-Relational Mapping) functionality to the Postgres Database. It allows the access of tables in the database as if they were Ruby objects. By following convention over configuration, complex database queries become relatively straight forward.

* [*Spotify API*](https://github.com/alexreisner/geocoder) - 


* [*Google Maps API*](https://developers.google.com/maps/) - 


### Process
Initially my idea for the app was of a much larger scope, including splitting users between those looking for burgers (customers) and those selling burgers (owners). With this in mind I created a set of wireframes that would show each users route through the app, laying out the different paths they might take. This allowed me to fine tune my basic idea, and get an idea of what pages I would need to create and what I would include in the database. 

I had initially planned to include each burgers fillings, but soon realised that consrtucting the appropriate tables and realations was beyond my current ability and could be added later. This along, with deciding to focus on one type of user 


### Challenges
* 
* 


### Future Improvements
 * Add a favourites feature so users can save their favourite burgers or track which ones they have tried before.
 * Use of the users ip address for positioning in case their geolocation cannot be gathered. 
 * User settings to update thier information and easily view thier favourite burgers.
 * Vegan, Vegetarain, Carnivore settings to cater more accurately to user's preferences.
 * Ability for shop owners to create and manage pages.

* Authors 
[Franzzisco Arrieta](https://github.com/Franzzisco), [Devatanu Deka](https://github.com/devadeka), [Michael Hebblethwaite](https://github.com/michebble), [Matilda Rutherford](https://github.com/matilda26)
