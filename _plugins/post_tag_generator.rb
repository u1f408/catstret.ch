Jekyll::Hooks.register :posts, :post_write do |post|
  all_existing_tags = Dir.entries("_post_tags")
    .map { |t| t.match(/(.*).md/) }
    .compact.map { |m| m[1] }

  tags = post['tags'].reject { |t| t.empty? }
  tags.each do |tag|
    next if all_existing_tags.include?(tag)
    File.open("_post_tags/#{tag}.md", "w") do |fh|
      fh << "---\ntitle: #{tag}\n---\n"
    end
  end
end
