# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FeedbackbinElements is a Rails engine gem providing a shadcn-inspired UI component library built with Tailwind CSS. It packages reusable view components as Rails helpers that can be used in any Rails application.

## Development Commands

### Running the Development Server
```bash
cd test/dummy
bin/rails server
```
Visit `http://localhost:3000/showcase` to see the component documentation via Showcase.

### Running Tests
```bash
cd test/dummy
bundle exec rails test
```

Run a specific test file:
```bash
cd test/dummy
bundle exec rails test test/controllers/feedbackbin_elements/docs/components_controller_test.rb
```

Run a single test:
```bash
cd test/dummy
bundle exec rails test test/controllers/feedbackbin_elements/docs/components_controller_test.rb:27
```

### Building the Gem
```bash
rake build
```

### Installing the Gem Locally
```bash
rake install:local
```

## Architecture

### Rails Engine Structure

This is a mountable Rails engine using `isolate_namespace FeedbackbinElements`. The engine provides:

1. **Helper-based Components**: Each component is implemented as a helper module in `app/helpers/feedbackbin_elements/` that renders a partial in `app/views/feedbackbin_elements/components/`

2. **Automatic Helper Inclusion**: The engine initializer (`lib/feedbackbin_elements/engine.rb:28-47`) automatically includes all component helpers into `ActionView::Base`, making them available globally in any Rails app that includes this gem

3. **Asset Pipeline Integration**:
   - Tailwind CSS via `tailwindcss-rails` gem
   - JavaScript via `importmap-rails` with Stimulus controllers
   - Engine-specific importmap defined in `config/importmap.rb`

### Component Architecture

Each component follows this pattern:

1. **Helper Module** (`app/helpers/feedbackbin_elements/*_helper.rb`):
   - Main render method (e.g., `render_button`, `render_badge`)
   - Private methods for generating Tailwind class strings
   - Uses `tw_merge` helper to intelligently merge custom classes with component defaults

2. **Partial** (`app/views/feedbackbin_elements/components/_*.html.erb`):
   - Renders the actual HTML markup
   - Receives data from helper as local variables

3. **Documentation View** (`app/views/feedbackbin_elements/docs/components/*.html.erb`):
   - Shows usage examples for each component
   - Includes sub-partials for different variations

### Key Patterns

**Class Management**: All components use `TailwindMergeHelper#tw_merge` to merge base classes, variant classes, and custom classes. This allows users to override component styles intelligently:

```ruby
options[:class] = tw_merge(base_classes, variant_classes, size_classes, custom_classes)
```

**Variant System**: Components use case statements to map variant symbols to Tailwind class strings (see `app/helpers/feedbackbin_elements/button_helper.rb:45-82` for example)

**Dual Rendering**: Components that can be both links and buttons (like Button) conditionally render different HTML tags based on presence of `href` parameter

### Documentation with Showcase

Component documentation is powered by the `showcase-rails` gem:
- Showcase is mounted at `/showcase` in `test/dummy/config/routes.rb`
- Preview files are located in `test/dummy/app/views/showcase/previews/`
- Each component preview is a partial (e.g., `_button.html.erb`) that uses the Showcase API
- Showcase provides automatic performance metrics, dark mode, and a clean UI
- Visit `http://localhost:3000/showcase` when the dev server is running

### Dependencies

Core dependencies (from `feedbackbin_elements.gemspec`):
- `rails >= 8.1.1`
- `tailwindcss-rails` - Tailwind CSS integration
- `tailwind_merge` - Smart class merging
- `importmap-rails` - JavaScript module loading
- `turbo-rails` & `stimulus-rails` - Hotwire stack
- `propshaft` - Asset pipeline
- `lucide-rails` - Icon library
- `showcase-rails` (development) - Component preview and documentation system

### Test Dummy App

Located in `test/dummy/`, this is a minimal Rails app used for:
- Running tests
- Development server for documentation
- Integration testing

## Adding a New Component

1. Create helper module in `app/helpers/feedbackbin_elements/`
2. Create partial in `app/views/feedbackbin_elements/components/`
3. Add helper to engine initializer in `lib/feedbackbin_elements/engine.rb`
4. Create Showcase preview in `test/dummy/app/views/showcase/previews/components/`
5. Update README.md component list

### Creating a Showcase Preview

Showcase previews use a simple API. Here's a template:

```erb
<%
  showcase.title "Component Name"
  showcase.description "Brief description of the component."
%>

<% showcase.sample "Variant Name" do %>
  <div class="flex gap-4">
    <%= render_component(...) %>
  </div>
<% end %>

<% showcase.sample "Another Variant" do %>
  <%= render_component(...) %>
<% end %>
```

Key points:
- Previews are partial files with leading underscore (e.g., `_button.html.erb`)
- Use `showcase.title` and `showcase.description` at the top
- Create multiple samples with `showcase.sample "Name" do ... end`
- Each sample renders live component examples
- Showcase automatically tracks performance metrics
- Preview files are automatically discovered and added to the sidebar
