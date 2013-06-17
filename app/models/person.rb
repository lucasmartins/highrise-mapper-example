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

  belongs_to :company

  validates :name, :email, :company, :presence => true

  def highrise_mapping
    {'first-name'=>self.name,'last-name'=>self.last_name,'company-name'=>self.company_name,'contact-data'=>['email-addresses'=>[{'address'=>self.email}]]}
  end

  def highrise_context
    self.company  
  end
  #must be included after required behavior has been added to the Class
  include HighriseMapper::Person
end
