module UserResolver

  class One
    def self.call(obj, args, ctx)
      SpreeUser.find(args[:id], ctx[:token])
    end
  end

end