module HighriseMapper  
  module Context
    module ClassMethods
      
    end
    
    module InstanceMethods
      def setup_highrise
        Highrise::Base.site = self.highrise_base_url
        Highrise::Base.user = self.highrise_token
        Highrise::Base.format = :xml
      end
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
      check_expected_behavior(receiver)
    end

    private
    def self.check_expected_behavior(receiver)
      unless receiver.method_defined? 'highrise_base_url'
        raise 'Your model must respond to "highrise_base_url"'
      end
      unless receiver.method_defined? 'highrise_token'
        raise 'Your model must respond to "highrise_token"'
      end
    end
  end

  module Person
    module ClassMethods
      
    end
    
    module InstanceMethods
      def save_to_highrise
        self.highrise_context.setup_highrise
        
      end
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
      check_expected_behavior(receiver)
    end

    private
    def self.check_expected_behavior(receiver)
      unless receiver.method_defined? 'highrise_mapping'
        raise <<-EOT

          Your model must respond to "highrise_mapping", which is a Hash where you map between the keys Highrise uses and your model attributes, like this one:
            def highrise_mapping
              {'first-name'=>self.name,'last-name'=>self.last_name,'company-name'=>self.company,'contact-data'=>['email-addresses'=>[{'address'=>'jonh@gmail.com','location'=>'work'}]]}
            end
        EOT
      end
      unless receiver.method_defined? 'highrise_context'
        raise 'Your model must respond to "highrise_context", where it returns the Instace of the HighriseMapper::Context model'
      end
    end
  end

end