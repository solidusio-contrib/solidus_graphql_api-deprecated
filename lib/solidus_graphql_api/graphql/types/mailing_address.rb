# frozen_string_literal: true
module Spree::GraphQL::Types::MailingAddress

  # address1: The first line of the address. Typically the street address or PO Box number.
  # @return [Types::String]
  def address1()
    object.address1
  end

  # address2: The second line of the address. Typically the number of the apartment, suite, or unit.
  # @return [Types::String]
  def address2()
    object.address2
  end

  # city: The name of the city, district, village, or town.
  # @return [Types::String]
  def city()
    object.city
  end

  # company: The name of the customer's company or organization.
  # @return [Types::String]
  def company()
    object.company
  end

  # country: The name of the country.
  # @return [Types::String]
  def country()
    object.country.name
  end

  # countryCodeV2: The two-letter code for the country of the address. For example, US.
  # @return [Types::CountryCode]
  def country_code_v2()
    object.country_iso
  end

  # firstName: The first name of the customer.
  # @return [Types::String]
  def first_name()
    object.firstname
  end

  # formatted: A formatted version of the address, customized by the provided arguments.
  # @param with_name [Types::Boolean] (false) Whether to include the customer's name in the formatted address.
  # @param with_company [Types::Boolean] (true) Whether to include the customer's company in the formatted address.
  # @return [[Types::String!]!]
  def formatted(with_name:, with_company:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # formattedArea: A comma-separated list of the values for city, province, and country.
  # @return [Types::String]
  def formatted_area()
    [city, province, country].compact.join(', ')
  end

  # lastName: The last name of the customer.
  # @return [Types::String]
  def last_name()
    object.lastname
  end

  # latitude: The latitude coordinate of the customer address.
  # @return [Types::Float]
  def latitude()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # longitude: The longitude coordinate of the customer address.
  # @return [Types::Float]
  def longitude()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # name: The full name of the customer, based on firstName and lastName.
  # @return [Types::String]
  def name()
    object.full_name
  end

  # phone: A unique phone number for the customer. Formatted using E.164 standard. For example, _+16135551111_.
  # @return [Types::String]
  def phone()
    object.phone
  end

  # province: The region of the address, such as the province, state, or district.
  # @return [Types::String]
  def province()
    object.state.try(:name) || object.state_name
  end

  # provinceCode: The two-letter code for the region. For example, ON.
  # @return [Types::String]
  def province_code()
    object.state.try(:abbr)
  end

  # zip: The zip or postal code of the address.
  # @return [Types::String]
  def zip()
    object.zipcode
  end
end
