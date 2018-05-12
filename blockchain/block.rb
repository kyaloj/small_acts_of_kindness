require 'digest'  
require 'pp'      ## pp = pretty print

class Block
  attr_reader :data, :hash

  def initialize(data)
    @data = data
    @hash = Digest::SHA256.hexdigest( data )
  end
end