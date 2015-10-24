module Helpers
  def header_link_path
    if current_page.path == 'index.html'
      '/about'
    else
      '/'
    end
  end

  def not_in_development?
    %w(staging production).include?(ENV["RACK_ENV"])
  end
end
