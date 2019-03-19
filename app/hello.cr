require "crsfml"
require "math"
require "totem"
require "./Config/Tile"
require "./Config/Tileset"
require "./Config/Tilemap"

#require "./Event"
#require "./Component"
#require "./widget/Widget"
#require "./widget/SimpleButton"
#require "./Instance"
#require "./Application"
#
#app = Application.new(SF::VideoMode.new(800,600),"My Window")
#app.vertical_sync_enabled = false
#app.framerate_limit = 60
#app.start

tileset = Tileset.load "resources/pacman.tileset"

