require 'fission'

module Fission
  module Eventer
    autoload :Store, 'fission-eventer/store'
  end
end

require 'fission-eventer/store'
require 'fission-eventer/version'
