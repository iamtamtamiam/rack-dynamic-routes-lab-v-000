class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      @@items.each do |item|
        if @@items.find{|all_item| all_item.name == item}
          resp.write "#{item.price}"
        elsif 
          resp.write "Item not found."
          resp.status = 400
        end 
      end
    else
      resp.write "Item not found. Route not found."
      resp.status = 404
    end
 
    resp.finish
  end
end