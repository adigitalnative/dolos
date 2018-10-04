# dolos
A Dungeon Crawling CLI

## Setup
Clone the repo, bundle, and set up your database. 

	bundle install
	rake db:create
	rake db:migrate

Optional: Run the database seed. This will create a starter game to play.

	rake db:seed

## Development

Dolos uses RSpec to test most functionality. To run specs, you need to migrate the DB in the test environment.

	rake db:migrate DOLOS_ENV="test"

Models live in `app/models`, all other game logic lives in `lib`. Add specific abilities to a player via modules and inherit the module in Game.rb

## Colors

Colors are a thing in the game! Colors can be used throughout for user prompts - check the `colorizer` gem for available methods.

In most places that a player is saving a string to the database, they can add color to that string. The color-able string is parsed via `ColorOutput.parse()` before being saved. The string is set within `ColorOutput`, and defaults to `%color:colorname`. Multiple codes can be used within a single string, and Colorizer automatically goes to default after a color string.

## Gameplay

Start up the game with `ruby bin/dolos.rb`

Help can be accessed by `help`, to leave the game type `exit`.

You can `load` saved games or start a `new` game.

### Build Mode

A user can build out the game... from inside the game! `help` from a game console will give more information.