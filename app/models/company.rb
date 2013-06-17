class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :highrise_base_url, type: String
  field :highrise_token, type: String

  #must be included after required behavior has been added to the Class
  include HighriseMapper::Context

  validates :name, :highrise_base_url, :highrise_token, :presence => true
  
  def test
   puts 'lol' 
  end
end