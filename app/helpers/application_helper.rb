module ApplicationHelper
  def bs_icon(name, text = '')
    raw "<i class='glyphicon glyphicon-#{name}'></i> #{text}"
  end
end
