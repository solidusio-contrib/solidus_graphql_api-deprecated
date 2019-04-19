# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::ImageStyle < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ImageStyle'

  description 'The set of valid styles for the image. Image styles are alternative versions based on the original image
  which differ from the original image for post-processing methods, used for generating images with different sizes,
  cropping methods and other post-processing effects.'

  def self.image_styles
    Spree::Image.attachment_definitions[:attachment][:styles].keys
  end

  image_styles.sort.each do |style|
    value style.to_s.upcase, "#{style.inspect} style", value: style
  end
end
