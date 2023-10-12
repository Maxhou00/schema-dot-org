# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  # Model the Schema.org `ItemList`.  See https://schema.org/ItemList
  class ItemList < SchemaType
    validated_attr :itemListElement,   type: Array,    presence: true
    validated_attr :itemListOrder,     type: String,   allow_nil: true
    validated_attr :numberOfItems,     type: Integer,  allow_nil: true

    validated_attr :url,               type: String,   allow_nil: true
    validated_attr :image,             type: String,   allow_nil: true


    def _to_json_struct
      {
        'itemListOrder' => itemListOrder,
        'numberOfItems' => numberOfItems,
        'url' => url,
        'image' => image,
        'itemListElement' => itemListElement.map(&:to_json_struct)
      }
    end

    def itemListElement
      @itemListElement || []
    end
  end
end
