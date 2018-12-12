require 'action_view'

f = File.read('./views/hello_world.erb')
ERBHandler = ActionView::Template::Handlers::ERB.new

view = ActionView::Template.new(f, 'partial', ERBHandler, locals: [:hoge])

class Context
  def initialize()
    @hoge = 'class variable'
  end

  def foo
    'foo'
  end

  def partial
    ActionView::Template.new(
      "partial view <%= @hoge %>",
      "partial",
      ERBHandler,
      virtual_path: "partial"
    )
  end
end

puts view.render(Context.new, {hoge: 'test variable'})
