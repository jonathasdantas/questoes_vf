class ReduClient
  def initialize(access_token, space_id)
    @space_id = space_id
    @access_token = access_token
  end

  def create_canvas(url, name)
    attrs = { :canvas => { :current_url => url, :name => name } }
    connection.post("api/spaces/#{@space_id}/canvas", attrs)
  end

  def first_subject_id
    response = connection.get("api/spaces/#{@space_id}/subjects")
    response.body.first["id"]
  end

  def remove_canvas(canvas_id)
    connection.delete("api/canvas/#{canvas_id}")
  end

  def create_subject(name)
    attrs = { :subject => { :name => name } }
    connection.post("api/spaces/#{@space_id}/subjects", attrs)
  end

  def create_lecture(subject_id, name, url)
    attrs = { :lecture => { :name => name, :current_url => url, :type => 'Canvas' } }
    connection.post("api/subjects/#{subject_id}/lectures", attrs)
  end

  def members_count()
    attrs = { :role => 'member' }
    response = connection.get("api/spaces/#{@space_id}/users", attrs)
    response.body.count
  end

  def get_user_role()
    response = connection.get("api/spaces/#{@space_id}/users")

    response.body.each{ |element|  
      puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      puts "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
      puts element
      puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
      puts element
      puts element

      if element[:role] == "member"
        puts element[:name]
      end
    } 
  end

  def get_user_role()
    response = connection.get("api/spaces/#{@space_id}/enrollments")

    response.body.each{ |element|  
      puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      puts "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
      puts element
      puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
      puts element
      puts element

      if element[:role] == "member"
        puts element[:name]
      end
    } 
  end

  def connection
    @conn ||= Faraday.new(:url => 'http://redu.com.br') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.headers['Authorization'] = "OAuth #{@access_token}"
      faraday.adapter  Faraday.default_adapter
      faraday.response :json, :content_type => /\bjson$/
    end
  end
end