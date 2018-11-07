class Spree::GraphQL::Schema::Types::CurrencyCode < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'CurrencyCode'
  description %q{Currency codes}
  include ::Spree::GraphQL::Types::CurrencyCode
  value 'USD', %q{United States Dollars (USD).}
  value 'EUR', %q{Euro (EUR).}
  value 'GBP', %q{United Kingdom Pounds (GBP).}
  value 'CAD', %q{Canadian Dollars (CAD).}
  value 'AFN', %q{Afghan Afghani (AFN).}
  value 'ALL', %q{Albanian Lek (ALL).}
  value 'DZD', %q{Algerian Dinar (DZD).}
  value 'AOA', %q{Angolan Kwanza (AOA).}
  value 'ARS', %q{Argentine Pesos (ARS).}
  value 'AMD', %q{Armenian Dram (AMD).}
  value 'AWG', %q{Aruban Florin (AWG).}
  value 'AUD', %q{Australian Dollars (AUD).}
  value 'BBD', %q{Barbadian Dollar (BBD).}
  value 'AZN', %q{Azerbaijani Manat (AZN).}
  value 'BDT', %q{Bangladesh Taka (BDT).}
  value 'BSD', %q{Bahamian Dollar (BSD).}
  value 'BHD', %q{Bahraini Dinar (BHD).}
  value 'BIF', %q{Burundian Franc (BIF).}
  value 'BYR', %q{Belarusian Ruble (BYR).}
  value 'BZD', %q{Belize Dollar (BZD).}
  value 'BTN', %q{Bhutanese Ngultrum (BTN).}
  value 'BAM', %q{Bosnia and Herzegovina Convertible Mark (BAM).}
  value 'BRL', %q{Brazilian Real (BRL).}
  value 'BOB', %q{Bolivian Boliviano (BOB).}
  value 'BWP', %q{Botswana Pula (BWP).}
  value 'BND', %q{Brunei Dollar (BND).}
  value 'BGN', %q{Bulgarian Lev (BGN).}
  value 'MMK', %q{Burmese Kyat (MMK).}
  value 'KHR', %q{Cambodian Riel.}
  value 'CVE', %q{Cape Verdean escudo (CVE).}
  value 'KYD', %q{Cayman Dollars (KYD).}
  value 'XAF', %q{Central African CFA Franc (XAF).}
  value 'CLP', %q{Chilean Peso (CLP).}
  value 'CNY', %q{Chinese Yuan Renminbi (CNY).}
  value 'COP', %q{Colombian Peso (COP).}
  value 'KMF', %q{Comorian Franc (KMF).}
  value 'CDF', %q{Congolese franc (CDF).}
  value 'CRC', %q{Costa Rican Colones (CRC).}
  value 'HRK', %q{Croatian Kuna (HRK).}
  value 'CZK', %q{Czech Koruny (CZK).}
  value 'DKK', %q{Danish Kroner (DKK).}
  value 'DOP', %q{Dominican Peso (DOP).}
  value 'XCD', %q{East Caribbean Dollar (XCD).}
  value 'EGP', %q{Egyptian Pound (EGP).}
  value 'ETB', %q{Ethiopian Birr (ETB).}
  value 'XPF', %q{CFP Franc (XPF).}
  value 'FJD', %q{Fijian Dollars (FJD).}
  value 'GMD', %q{Gambian Dalasi (GMD).}
  value 'GHS', %q{Ghanaian Cedi (GHS).}
  value 'GTQ', %q{Guatemalan Quetzal (GTQ).}
  value 'GYD', %q{Guyanese Dollar (GYD).}
  value 'GEL', %q{Georgian Lari (GEL).}
  value 'HTG', %q{Haitian Gourde (HTG).}
  value 'HNL', %q{Honduran Lempira (HNL).}
  value 'HKD', %q{Hong Kong Dollars (HKD).}
  value 'HUF', %q{Hungarian Forint (HUF).}
  value 'ISK', %q{Icelandic Kronur (ISK).}
  value 'INR', %q{Indian Rupees (INR).}
  value 'IDR', %q{Indonesian Rupiah (IDR).}
  value 'ILS', %q{Israeli New Shekel (NIS).}
  value 'IQD', %q{Iraqi Dinar (IQD).}
  value 'JMD', %q{Jamaican Dollars (JMD).}
  value 'JPY', %q{Japanese Yen (JPY).}
  value 'JEP', %q{Jersey Pound.}
  value 'JOD', %q{Jordanian Dinar (JOD).}
  value 'KZT', %q{Kazakhstani Tenge (KZT).}
  value 'KES', %q{Kenyan Shilling (KES).}
  value 'KWD', %q{Kuwaiti Dinar (KWD).}
  value 'KGS', %q{Kyrgyzstani Som (KGS).}
  value 'LAK', %q{Laotian Kip (LAK).}
  value 'LVL', %q{Latvian Lati (LVL).}
  value 'LBP', %q{Lebanese Pounds (LBP).}
  value 'LSL', %q{Lesotho Loti (LSL).}
  value 'LRD', %q{Liberian Dollar (LRD).}
  value 'LTL', %q{Lithuanian Litai (LTL).}
  value 'MGA', %q{Malagasy Ariary (MGA).}
  value 'MKD', %q{Macedonia Denar (MKD).}
  value 'MOP', %q{Macanese Pataca (MOP).}
  value 'MWK', %q{Malawian Kwacha (MWK).}
  value 'MVR', %q{Maldivian Rufiyaa (MVR).}
  value 'MXN', %q{Mexican Pesos (MXN).}
  value 'MYR', %q{Malaysian Ringgits (MYR).}
  value 'MUR', %q{Mauritian Rupee (MUR).}
  value 'MDL', %q{Moldovan Leu (MDL).}
  value 'MAD', %q{Moroccan Dirham.}
  value 'MNT', %q{Mongolian Tugrik.}
  value 'MZN', %q{Mozambican Metical.}
  value 'NAD', %q{Namibian Dollar.}
  value 'NPR', %q{Nepalese Rupee (NPR).}
  value 'ANG', %q{Netherlands Antillean Guilder.}
  value 'NZD', %q{New Zealand Dollars (NZD).}
  value 'NIO', %q{Nicaraguan Córdoba (NIO).}
  value 'NGN', %q{Nigerian Naira (NGN).}
  value 'NOK', %q{Norwegian Kroner (NOK).}
  value 'OMR', %q{Omani Rial (OMR).}
  value 'PKR', %q{Pakistani Rupee (PKR).}
  value 'PGK', %q{Papua New Guinean Kina (PGK).}
  value 'PYG', %q{Paraguayan Guarani (PYG).}
  value 'PEN', %q{Peruvian Nuevo Sol (PEN).}
  value 'PHP', %q{Philippine Peso (PHP).}
  value 'PLN', %q{Polish Zlotych (PLN).}
  value 'QAR', %q{Qatari Rial (QAR).}
  value 'RON', %q{Romanian Lei (RON).}
  value 'RUB', %q{Russian Rubles (RUB).}
  value 'RWF', %q{Rwandan Franc (RWF).}
  value 'WST', %q{Samoan Tala (WST).}
  value 'SAR', %q{Saudi Riyal (SAR).}
  value 'STD', %q{Sao Tome And Principe Dobra (STD).}
  value 'RSD', %q{Serbian dinar (RSD).}
  value 'SCR', %q{Seychellois Rupee (SCR).}
  value 'SGD', %q{Singapore Dollars (SGD).}
  value 'SDG', %q{Sudanese Pound (SDG).}
  value 'SYP', %q{Syrian Pound (SYP).}
  value 'ZAR', %q{South African Rand (ZAR).}
  value 'KRW', %q{South Korean Won (KRW).}
  value 'SSP', %q{South Sudanese Pound (SSP).}
  value 'SBD', %q{Solomon Islands Dollar (SBD).}
  value 'LKR', %q{Sri Lankan Rupees (LKR).}
  value 'SRD', %q{Surinamese Dollar (SRD).}
  value 'SZL', %q{Swazi Lilangeni (SZL).}
  value 'SEK', %q{Swedish Kronor (SEK).}
  value 'CHF', %q{Swiss Francs (CHF).}
  value 'TWD', %q{Taiwan Dollars (TWD).}
  value 'THB', %q{Thai baht (THB).}
  value 'TZS', %q{Tanzanian Shilling (TZS).}
  value 'TTD', %q{Trinidad and Tobago Dollars (TTD).}
  value 'TND', %q{Tunisian Dinar (TND).}
  value 'TRY', %q{Turkish Lira (TRY).}
  value 'TMT', %q{Turkmenistani Manat (TMT).}
  value 'UGX', %q{Ugandan Shilling (UGX).}
  value 'UAH', %q{Ukrainian Hryvnia (UAH).}
  value 'AED', %q{United Arab Emirates Dirham (AED).}
  value 'UYU', %q{Uruguayan Pesos (UYU).}
  value 'UZS', %q{Uzbekistan som (UZS).}
  value 'VUV', %q{Vanuatu Vatu (VUV).}
  value 'VEF', %q{Venezuelan Bolivares (VEF).}
  value 'VND', %q{Vietnamese đồng (VND).}
  value 'XOF', %q{West African CFA franc (XOF).}
  value 'YER', %q{Yemeni Rial (YER).}
  value 'ZMW', %q{Zambian Kwacha (ZMW).}
end