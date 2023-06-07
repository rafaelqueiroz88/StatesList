# State List API

A simple catalogue to list States and it's Cities

## Resume

<br />

This is a simple API to list States and Cities built with Ruby on Rails. Refer to doc. for more information.<br /><br />
<hr />

## Getting Started

<br />

This project has a dependencie on a Front-End project <br />
Refer to the <a href="https://github.com/rafaelqueiroz88/StatesListFront" />Front-End Github Project</a> <br />
Clone it and put them side-by-side and follow their instructions. <br />

There are some third party libraries in this project.
In order to install them just run <code>bundler</code>. Check <code>Gemfile</code> for more details.

<br />

```
bundle install
```
<br />

### Docker

<br />

If you have Docker installed, you can run this project inside Docker Containers. Simple run build and up commands.

<br />

Build
```
docker-compose build
```

<br />

Up
```
docker-compose up
```

### Rails Server

<br />

*Ignore this step if you have Docker installed. <br />
If you want to run the server using Rails Server just run the follow command:

<br />

```
rails s
```

<br />

## Database

<br />

This project has a database and needs a configuration. Rails can set all basic setup by running create, migrate and seed commands.

<br />

Bash
```
rails db:create db:migrate db:seed
```

<br />

Docker
```
docker exec -it stateslistback rails db:create db:migrate db:seed
```

<br />

Pick up your favorite browser and have fun and
refer to doc. for more API informations <br />

https://documenter.getpostman.com/view/2868613/2s93sZ8F2p
