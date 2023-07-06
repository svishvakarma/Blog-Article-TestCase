require 'test_helper'

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    
    def set_devise_mapping(context:)
      env =
        if context.respond_to?(:env_config)
          context.env_config
        elsif context.respond_to?(:env)
          context.env
        end
    
      env['devise.mapping'] = Devise.mappings[:user] if env
    end
  end
end
