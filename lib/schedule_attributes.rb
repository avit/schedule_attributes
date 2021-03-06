require 'schedule_attributes/model'
require 'schedule_attributes/railtie' if defined? Rails
require 'schedule_attributes/form_builder' if defined? Formtastic

if defined? Arel
  module Arel::Visitors
    class ToSql

      # Allow schedule occurrences to be used directly as Time objects in
      # ActiveRecord queries
      #
      def visit_IceCube_Occurrence(value)
        quoted(value.to_time)
      end

    end
  end
end
