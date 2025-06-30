require 'erb'
require 'base64'
require 'rouge'

module Jekyll
  class FancyCodeBlock < Liquid::Block
    FCB_TEMPLATE = ERB.new <<-EOF.gsub(/^\s+/, '')
      <div class="fcb" id="fcb-<%= options[:slug] %>">
        <div class="fcb-header">
          <span class="fcb-name"><%= options[:name] || options[:slug] %></span>
          <div class="fcb-header-tools">
            <a href="<%= raw_url %>" target="_blank">raw</a>
          </div>
        </div>
        <figure class="highlight fcb-body">
          <pre><code class="language-<%= options[:lang].tr("+", "-") %>" data-lang="<%= options[:lang] %>"><%= code_html %></code></pre>
        </figure>
      </div>
    EOF

    OPTIONS_REGEX = %r!(?:\w="[^"]*"|\w=\w|\w)+!.freeze

    def initialize(tag_name, markup, options)
      super
      @options = parse_options(markup)
    end

    def render(context)
      input_data = super.chomp
      options = @options
      raw_url = @options[:raw] || "data:application/octet-stream;base64,#{Base64.urlsafe_encode64(input_data).gsub("\n", "")}"

      formatter = Rouge::Formatters::HTML.new
      lexer = Rouge::Lexer.find_fancy(@options[:lang], input_data) || Rouge::Lexers::PlainText
      code_html = formatter.format(lexer.lex(input_data)).chomp

      FCB_TEMPLATE.result(binding).to_s
    end

    private

    def parse_options(input)
      options = {}
      return options if input.empty?

      # Split along 3 possible forms -- key="<quoted list>", key=value, or key
      input.scan(OPTIONS_REGEX) do |opt|
        key, value = opt.split("=")
        value.delete!('"') if value&.include?('"')
        options[key.to_sym] = value || true
      end

      options
    end

  end
end

Liquid::Template.register_tag('fcb', Jekyll::FancyCodeBlock)
