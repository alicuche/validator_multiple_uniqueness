# Validator check is unique in multiple columns
class UniquenessMultipleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # fields need to validate
    fields = [attribute, *options[:scope]].uniq

    fields_value = []
    query_str = []
    fields.each do |field|
      field_value = record.send(field).try(:strip)
      fields_value << field_value if field_value.present?
      query_str << "#{field} IN (:value)"
    end

    return if fields_value.blank?

    shop_url = record.class.where(query_str.join(' OR '), value: fields_value)

    # except current record if it's update
    shop_url = shop_url.where.not(id: record.id) unless record.new_record?

    # check errors
    unless shop_url.size.zero?
      shop_fields = shop_url.limit(1).pluck(*fields).first.select(&:present?).map(&:strip)
      fields.each do |field|
        record.errors.add(field, :uniqueness_multiple) if shop_fields.include? record.send(field).try(:strip)
      end
    end
  end
end
