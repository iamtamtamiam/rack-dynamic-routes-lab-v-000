class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      item_searched = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
        if item = @@items.find{|items| items.name == item_searched}
          resp.write "#{item.price}"
        elsif 
          resp.write "Item not found."
          resp.status = 400
        end 
    else
      resp.write "Item not found. Route not found."
      resp.status = 404
    end
 
    resp.finish
  end
end