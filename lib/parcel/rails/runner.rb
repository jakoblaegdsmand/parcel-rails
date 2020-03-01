# frozen_string_literal: true

module Parcel
  module Rails
    class Runner
      def self.from_command_line(args)
        return from_config if args.empty?
        new(args)
      end

      def self.from_config
        to_args(::Rails.application.config.parcel)
      end

      def self.to_args(config)
        args = config.entry_points
        args << "--out-dir=#{config.destination}" if config.destination
        args << "--public-url=#{config.public_url}" if config.public_url
        args << "--experimental-scope-hoisting" if config.scope_hoisting
        args << "--cache-dir=#{config.cache_directory}" if config.cache_directory
        args << "--port=1234"
        args << "--hmr-port=6877"
        new(args)
      end

      def initialize(args)
        @args = args
      end

      def compile
        parcel_commmand(:build)
      end

      def serve
        parcel_commmand(:serve)
      end

      private

      def parcel_commmand(cmd = '')
        args = cmd == :build ? @args[0..-3] : @args
        command = "yarn run parcel #{cmd} #{args.join(' ')}"
        puts command
        puts `#{command}`
      end
    end
  end
end
