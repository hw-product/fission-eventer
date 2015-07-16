require 'fission-eventer'

module Fission
  module Eventer

    # Persist events to data store
    class Store < Fission::Callback

      # Load the data lib
      def setup(*_)
        require 'fission-data'
      end

      # Message is valid for this callback
      #
      # @param message [Carnivore::Message]
      # @return [Truthy, Falsey]
      def valid?(message)
        super do |payload|
          payload.get(:data, :event)
        end
      end

      # Disable events
      def event!(*_)
        # disable
      end

      # Store event data
      #
      # @param message [Carnivore::Message]
      def execute(message)
        failure_wrap(message) do |payload|
          event = Fission::Data::Models::Event.new
          event.message_id = payload.get(:data, :event, :data, :message_id)
          event.type = payload.get(:data, :event, :type)
          event.data = payload.fetch(:data, :event, :data, Smash.new)
          event.stamp = payload.fetch(:data, :event, :stamp, Time.now.to_f)
          debug "Storing received event: #{event.inspect}"
          event.save
          job_completed(:eventer, payload, message)
        end
      end

    end
  end

end

Fission.register(:eventer, :store, Fission::Eventer::Store)
