class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      @@items.each do |item|
        if 
        resp.write "#{item.price}"
      end
    elsif req.path.match(/items/)
      resp.write "Item not found."
      resp.status = 400
    else
      resp.write "Item not found. Route not found."
      resp.status = 404
    end
 
    resp.finish
  end
end