# MusicHall Web Application

Rewriting my old Django app 'MusicHall' in Rails with Angular2 (RC).
Source code for Django project: `https://github.com/khpatel4991/MusicHall`

## Setup

### Rails

	Ruby 2.3.0 (using RVM)
	Rails 4.2.6
	MariaDB
	Angular2 RC1

### Angular2

I am using the latest Angular2 seed project to setup the Angular2 `package.json`, `tsconfig.json` configuration in my Rails app.

#### Angular TS/JS Files

The `tsconfig.json` is set to have `outDir` to `public/app/js`, which will compile all ts files in `assets/typescript` folder to this directory, and added the path to rails.assets.path in application config file so that pipeline can find and transfer files using asset pipeline.

Another important change will be in the `systemjs.config` file which determines how to start the app and load all the dependency. Also, note that `systemjs.config` is called after `systemjs` is loaded.

#### Angular Template Files

The template files are placed in `assets/html` folder, which again will be served by asset pipeline, as so when requested. The important note here is the templateUrl in your component files will have a slighly different template path than normal Angular.

## Running

We are using Rails server to serve all the assets. But to transpile angular typescript assets to plain old JS, we need to have `tsc` in watch mode too, so any change in ts files will be immediately reflected in our assets.
TO automate both, I am using Foreman gem and in my `Procfile` I have both the commands mentioned.

	1. bundle install
	2. npm install
	3. bundle exec foreman start