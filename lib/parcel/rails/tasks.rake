# frozen_string_literal: true

namespace :parcel do
  desc 'Compiles assets using parcel bundler'
  task compile: :environment do
    Parcel::Rails::Runner.from_config.compile
  end

  desc 'Compiles assets using parcel bundler'
  task serve: :environment do
    Parcel::Rails::Runner.from_config.serve
  end

  desc 'Removes compiled assets'
  task :clobber do
    logger = Logger.new(STDOUT)
    logger.info("removing #{::Rails.application.config.parcel.destination}")
    FileUtils.rm_rf(::Rails.application.config.parcel.destination)
  end

  desc 'Cleans up old builds'
  task :clean do
    logger = Logger.new(STDOUT)
    logger.info('-- parcel:clean, doing nothing --')
  end

  task :clean_cache do
    logger = Logger.new(STDOUT)
    logger.info("removing #{::Rails.application.config.parcel.cache_directory}")
    FileUtils.rm_rf(::Rails.application.config.parcel.cache_directory)
  end
end

namespace :assets do
  task precompile: ['parcel:compile']
  task clobber: ['parcel:clobber']
  task clean: ['parcel:clean']
end
