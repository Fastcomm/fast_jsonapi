# frozen_string_literal: true

require 'active_support/notifications'

module FastJsonapi
  module ObjectSerializer
    alias serializable_hash_without_instrumentation serializable_hash

    def serializable_hash
      ActiveSupport::Notifications.instrument(SERIALIZABLE_HASH_NOTIFICATION, name: self.class.name) do
        serializable_hash_without_instrumentation
      end
    end
  end
end
