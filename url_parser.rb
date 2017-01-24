class UrlParser

  attr_accessor :scheme, :domain, :fragment_id

  def initialize(new_url)

    @new_url = new_url
    @scheme = new_url.split(":")[0]
    @domain = new_url.split(":")[1].gsub("//", "")
    @port = new_url.split("/")[2].split(":")[1]
    @path = new_url.split("/")[3].split("?")[0]
    @fragment_id = new_url.split("#")[1]
  end
  def query_string
    query_array = @new_url.split("#")[0].split("?")[1].split("&")
    query_hash = {}
    query_array.each do |query|
      query_hash[query.split("=")[0]] = query.split("=")[1]
    end
    query_hash
  end


  def path
    if @path != ""
      @path
    end
  end

  def port
    if @scheme == "http" && @new_url.split(":").length < 3
      "80"
    elsif @scheme == "https" && @new_url.split(":").length < 3
      "443"
    else
      @port
    end
  end
end
