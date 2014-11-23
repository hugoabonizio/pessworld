module ApplicationHelper
  def bs_icon(name, text = '')
    raw "<i class='glyphicon glyphicon-#{name}'></i> #{text}"
  end
  
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).gsub!("\n", '<br>').html_safe
  end
end
