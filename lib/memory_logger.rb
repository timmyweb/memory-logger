require 'active_support/core_ext/module/attr_internal'

module MemoryLogger #:nodoc:
  extend ActiveSupport::Concern

  included do
    before_filter :check_memory_logging
  end

  def check_memory_logging
    session[:mem_debug] = true if params[:mem_debug].to_s.eql?('on')
    session[:mem_debug] = nil if params[:mem_debug].to_s.eql?('off')
  end

  protected

  attr_internal :mem_usage

  def display_mem_usage?
    session[:mem_debug]
  end

  def append_info_to_payload(payload)
    super
    payload[:mem_usage] = (`ps -o rss= -p #{Process.pid}`).strip if display_mem_usage?
  end

  module ClassMethods
    def log_process_action(payload)
      messages, mem_usage = super, payload[:mem_usage]
      messages << ("Memory usage: #{mem_usage}kB") if mem_usage
      messages
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  include MemoryLogger
end