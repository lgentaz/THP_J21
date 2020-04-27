require 'bundler'
Bundler.require

# Simplification du chemin d'accès
$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'


# Lance l'application à chaque rafraichissement du serveur et/ou de la page
run ApplicationController
