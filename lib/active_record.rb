module ActiveRecord
  module QueryMethods
    # full text search
    def find_objects(txt, *opts)
      text = txt.strip.gsub('$', '')

      res = where("#{table_name}.txt_index @@ plainto_tsquery(unaccent($$#{text}$$))").order("ts_rank(#{table_name}.txt_index, plainto_tsquery($$#{text}$$)) desc")
      res = res.order("#{table_name}.name <-> $$#{text}$$") if column_names.include?('name')

      res
    end
  end

  module Querying
    delegate :find_objects, to: :all
  end
end