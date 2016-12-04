class JSONAPI::ResourceSerializer
  def attributes_hash(source)
    requested = requested_fields(source.class)
    fields = source.fetchable_fields & source.class._attributes.keys.to_a
    fields = requested & fields unless requested.nil?

    fields.each_with_object({}) do |name, hash|
      key = source.class._attribute_options(name)[:key]
      format = source.class._attribute_options(name)[:format]
      unless name == :id
        hash[format_key(key || name)] = format_value(source.public_send(name), format)
      end
    end
  end
end
