module Cucumber
  # The base class for configuring settings for a Cucumber run.
  class Configuration
    def self.default
      new
    end

    def self.parse(argument)
      return new(argument) if argument.is_a?(Hash)
      argument
    end

    def initialize(user_options = {})
      @options = default_options.merge(user_options)
    end

    def randomize?
      @options[:randomize]
    end

    def dry_run?
      @options[:dry_run]
    end

    def guess?
      @options[:guess]
    end

    def strict?
      @options[:strict]
    end

    def expand?
      @options[:expand]
    end

    def paths
      @options[:paths]
    end

    def autoload_code_paths
      @options[:autoload_code_paths]
    end

    def snippet_type
      @options[:snippet_type]
    end

    # An array of procs that can generate snippets for undefined steps. These procs may be called if a
    # formatter wants to display snippets to the user.
    #
    # Each proc should take the following arguments:
    # 
    #  - keyword
    #  - step text
    #  - multiline argument
    #  - snippet type
    #
    def snippet_generators
      @options[:snippet_generators] ||= []
    end

    def register_snippet_generator(generator)
      snippet_generators << generator
    end

  private

    def default_options
      {
        :autoload_code_paths => ['features/support', 'features/step_definitions']
      }
    end
  end
end
