# frozen_string_literal: true
module Spree::GraphQL::Types::Image

  # altText: A word or phrase to share the nature or contents of an image.
  # @return [Types::String]
  def alt_text()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: A unique identifier for the image.
  # @return [Types::ID]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # originalSrc: The location of the original (untransformed) image as a URL.
  # @return [Types::URL!]
  def original_src()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # transformedSrc: The location of the transformed image as a URL. All transformation arguments are considered "best-effort". If they can be applied to an image, they will be. Otherwise any transformations which an image type does not support will be ignored.
  # @param max_width [Types::Int] Image width in pixels between 1 and 5760.
  # @param max_height [Types::Int] Image height in pixels between 1 and 5760.
  # @param crop [Types::CropRegion] Crops the image according to the specified region.
  # @param scale [Types::Int] (1) Image size multiplier for high-resolution retina displays. Must be between 1 and 3.
  # @param preferred_content_type [Types::ImageContentType] Best effort conversion of image into content type (SVG -> PNG, Anything -> JGP, Anything -> WEBP are supported).
  # @return [Types::URL!]
  def transformed_src(max_width:, max_height:, crop:, scale:, preferred_content_type:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end