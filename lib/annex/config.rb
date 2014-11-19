module Annex
  module Config
    # Annex is setup to try and authenticate with warden
    # If warden is found, then it will try to authenticate
    #
    # This is valid for custom warden setups, and also devise
    # If you're using the admin setup for devise, you should set Annex to use the admin
    #
    # @see Annex::Config.authenticate_with
    # @see Annex::Config.authorize_with
    DEFAULT_AUTHENTICATION = Proc.new do
      request.env['warden'].try(:authenticate!)
    end

    DEFAULT_AUTHORIZE = Proc.new {}

    DEFAULT_CURRENT_USER = Proc.new do
      request.env["warden"].try(:user) || respond_to?(:current_user) && current_user
    end


    class << self

      # Setup authentication to be run as a before filter
      # This is run inside the controller instance so you can setup any authentication you need to
      #
      # By default, the authentication will run via warden if available
      # and will run the default.
      #
      # If you use devise, this will authenticate the same as _authenticate_user!_
      #
      # @example Devise admin
      #   Annex.config do |config|
      #     config.authenticate_with do
      #       authenticate_admin!
      #     end
      #   end
      #
      # @example Custom Warden
      #   Annex.config do |config|
      #     config.authenticate_with do
      #       warden.authenticate! :scope => :paranoid
      #     end
      #   end
      #
      # @see Annex::Config::DEFAULT_AUTHENTICATION
      def authenticate_with(&blk)
        @authenticate = blk if blk
        @authenticate || DEFAULT_AUTHENTICATION
      end

      # Setup authorization to be run as a before filter
      # This is run inside the controller instance so you can setup any authorization you need to.
      #
      # By default, there is no authorization.
      #
      # @example Custom
      #   Annex.config do |config|
      #     config.authorize_with do
      #       redirect_to root_path unless warden.user.is_admin?
      #     end
      #   end
      #
      # To use an authorization adapter, pass the name of the adapter. For example,
      # to use with CanCan[https://github.com/ryanb/cancan], pass it like this.
      #
      # @example CanCan
      #   Annex.config do |config|
      #     config.authorize_with :cancan
      #   end
      #
      # @see Annex::Config::DEFAULT_AUTHORIZE
      def authorize_with(*args, &block)
        extension = args.shift
        if(extension)
          @authorize = Proc.new {
            @authorization_adapter = Annex::AUTHORIZATION_ADAPTERS[extension].new(*([self] + args).compact)
          }
        else
          @authorize = block if block
        end
        @authorize || DEFAULT_AUTHORIZE
      end

      def connect_with(adapter = :activerecord)
        @adapter = adapter
      end

    end
  end
end