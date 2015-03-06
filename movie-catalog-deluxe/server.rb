require 'sinatra'
require 'pg'
use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

def db_conxt
  begin
    connection = PG.connect(dbname: "movies")
    yield(connection)
  ensure
    connection.close
  end
end


get "/actors" do
  page = 1
  session[:page]=[0,0]
  ACTORS_ARRAY = db_conxt{ |conx| conx.exec( "select (name) from actors order by name limit 20" ) }
  erb :'actors/index', locals: { actors: ACTORS_ARRAY, page: page }
end

get "/next_actors" do
  page = session[:page][0] += 1
  page = page + 1
  num = page * 20
  ACTORS_ARRAY = db_conxt{ |conx| conx.exec( "select (name) from actors order by name limit 20 offset #{num}" ) }
  erb :'actors/index', locals: { actors: ACTORS_ARRAY, page: page }
end

get "/actors/show" do
  actor = params[:actor]
    ACTOR_DETAIL = (db_conxt{ |conx| conx.exec_params("select movies.title, cast_members.character from actors
      join cast_members on actors.id = cast_members.actor_id
      join movies on cast_members.movie_id = movies.id where actors.name =($1)", [actor]) }).to_a
    erb :'actors/show', locals: { details: ACTOR_DETAIL, actor: actor }
end

get "/movies" do
  page = 1
  MOVIES_ARRAY = db_conxt{ |conx| conx.exec( "select (title) from movies order by title limit 20" ) }
  erb :'movies/index', locals: { movies: MOVIES_ARRAY, page: page }
end

get "/next_movies" do
   page = session[:page][1] += 1
   page = page + 1
   num = page * 20
  MOVIES_ARRAY = db_conxt{ |conx| conx.exec( "select (title) from movies order by title limit 20 offset #{num}" ) }
  erb :'movies/index', locals: { movies: MOVIES_ARRAY, page: page }
end

get "/movies/show" do
  movie = params[:movie]
  MOVIE_DETAIL = (db_conxt{ |conx| conx.exec_params("select movies.rating, movies.year, genres.name as genre, studios.name as studio, actors.name as actor, cast_members.character
    from actors
    join cast_members on actors.id = cast_members.actor_id
    join movies on cast_members.movie_id = movies.id
    join genres on movies.genre_id = genres.id
    join studios on movies.studio_id = studios.id
    where movies.title =($1)", [movie]) }).to_a
  erb :'movies/show', locals: { details: MOVIE_DETAIL, movie: movie }
end
