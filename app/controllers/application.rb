# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b5aaa5e95bc9956320a71e358a60f08e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

    before_filter :adjust_format_for_iphone
#    before_filter :iphone_login_required

    private

    # Set iPhone format if request to iphone.trawlr.com
    def adjust_format_for_iphone    
      request.format = :iphone if iphone_request?
    end

    # Force all iPhone users to login
    def iphone_login_required
      if iphone_request?
        redirect_to login_path unless logged_in?
      end
    end

    # Return true for requests to iphone.trawlr.com
    def iphone_request?
      return (request.subdomains.first == "iphone" || params[:format] == "iphone")
    end
  
end
