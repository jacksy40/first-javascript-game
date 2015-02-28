require "rack"
app = nil
class App
  def call(env)
    if env["path_info"]=="/"
    [200,{"Content-type" => "text/html"},["Welcome"]]
    else
    [404,{"Content-type" => "text/html"},["Does not exist"]]
    end
  end
end
app = App.new
Rack::Handler::WEBrick.run(app)
