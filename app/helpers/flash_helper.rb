module FlashHelper
  def flash_message(flashes)
    flashes.each do |flash|
      puts flash[:message] if flash.is_a?(Hash) && flash[:message]
    end
  end
end
