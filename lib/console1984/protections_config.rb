class Console1984::ProtectionsConfig
  include Console1984::Freezeable

  delegate :static_validations, to: :instance

  attr_reader :config

  def initialize(config)
    @config = config
  end

  %i[ static_validations forbidden_methods ].each do |method_name|
    define_method method_name do
      config[method_name].symbolize_keys
    end
  end
end
