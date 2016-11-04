class Translate
  attr_reader :translation

  def initialize(translation_params)
    gcloud = Google::Cloud.new
    translate = gcloud.translate ENV["GOOGLE_API_KEY"]
    @translation = translate.translate(
      translation_params[:message],
      from: translation_params[:from],
      to: translation_params[:to]
    )
  end

  def self.translate(translation_params)
    translation = self.new(translation_params)
    return translation.translation.text
  end
end
