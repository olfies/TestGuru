module SessionsHelper
  def flash_message(flash)
    flash.each do |type, message|
       content_tag :p, message, class: "flash #{type}"
    end
  end
end
