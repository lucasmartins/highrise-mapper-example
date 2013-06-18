class Person
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :last_name, type: String
  field :email, type: String
  field :company_name, type: String
  field :job_title, type: String
  field :phone, type: String
  field :website, type: String
  field :highrise_id, type: Fixnum

  belongs_to :company

  validates :name, :email, :company, :presence => true

  def full_name
    "#{name} #{last_name}"
  end

  def highrise_context
    self.company  
  end
  #must be included after required behavior has been added to the Class
  include HighriseMapper::Person
end
