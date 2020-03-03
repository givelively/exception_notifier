class ExceptionNotifier
  def self.call(*args)
    if args.first.is_a?(Exception)
      capture_exception(args)
    else
      capture_message(args)
    end
  end

  def self.capture_exception(args)
    Raven.capture_exception(args)
  end

  def self.capture_message(*args)
    if args.first.is_a?(String)
      message = args.first
      extra = args.drop(1)
    else
      message = 'Unknown parameter set.'
      extra = { parameters: args }
    end

    Raven.capture_message(message, extra: extra)
  end
end