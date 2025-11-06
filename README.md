# FeedbackbinElements

Shadcn-inspired UI component library for Ruby on Rails, built with Tailwind CSS.

## Components

- Accordion
- Alert
- Avatar
- Badge
- Breadcrumb
- Button
- Card
- Dropdown Menu
- Forms
- Popover
- Tabs
- Toast

## Usage

All component helpers are automatically available in your views:

```erb
<%= render_button text: "Click me", variant: :primary %>
<%= render_badge text: "New", variant: :success %>
<%= render_card do %>
  <h2>Card Title</h2>
  <p>Card content</p>
<% end %>
```

## Documentation

Mount the documentation engine in your routes to access interactive component examples:

```ruby
mount FeedbackbinElements::Engine, at: "/"
```

Then visit `/components` to view all component examples and usage.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "feedbackbin_elements"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install feedbackbin_elements
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
