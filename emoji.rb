require 'action_view'
require 'somemoji'

module ActionView
  module Template::Handlers
    class Emoji
      def call(template)
        converted = Somemoji.emoji_one_emoji_collection.replace_code(template.source) do |emoji|
          emoji.character
        end

        "'#{converted}'.to_s"
      end
    end
  end
end
EmojiHandler = ActionView::Template::Handlers::Emoji.new

view = ActionView::Template.new(':+1::tada::cyclone:', 'partial', EmojiHandler, {})

class Context
end

puts view.render(Context.new, {})
