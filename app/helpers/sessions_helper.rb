module SessionsHelper
  def flash_message(flash)
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    else
      flash.each do |type, message|
        content_tag :p, message, class: "flash #{type}"
      end
    end
  end
end
