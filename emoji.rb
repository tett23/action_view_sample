require 'action_view'

module ActionView
  module Template::Handlers
    class Emoji
      def call(template)
        "'🎉'"
      end
    end
  end
end
EmojiHandler = ActionView::Template::Handlers::Emoji.new

view = ActionView::Template.new('', 'partial', EmojiHandler, locals: [])

class Context
end

puts view.render(Context.new, {})
