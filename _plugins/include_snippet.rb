module Jekyll
  class IncludeSnippetTag < Liquid::Tag
    def initialize(tag_name, filename, tokens)
      super
      @filename = filename.strip
    end

    def add_include_to_dependency(site, path, context)
      if context.registers[:page]&.key?("path")
        site.regenerator.add_dependency(
          site.in_source_dir(context.registers[:page]["path"]),
          path
        )
      end
    end

    def render(context)
      site = context.registers[:site]
      collection = site.collections["snippets"]
      return unless collection

      file = collection.files.select{ |n| n.name == @filename }.first
      return unless file

      add_include_to_dependency(site, file.path, context)
      File.read(file.path)
    end
  end
end

Liquid::Template.register_tag('include_snippet', Jekyll::IncludeSnippetTag)
