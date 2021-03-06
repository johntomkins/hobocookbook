Frequenty Asked Questions and Misunderstandings
{: .document-title}

This document answers common questions and misunderstandings about Hobo.

Contents
{: .contents-heading}

- contents
{:toc}

# How do I get help with my questions about Hobo?

# What's a good development environment?

Webrick, Unicorn, etc? And a basic Gemfile (e.g. conditionally include
ruby-debug, switch Rack to 1.2.4 (or am I alone in getting crashes
when I use 1.2.5?)) with all the core bits, and a commented section
with the "extras" like the jquery stuff that Bryan has published.
So... "install rvm, install ruby 1.9.2, update gem, install rails
3.0.11, install hobo 1.3, edit Gemfile, run bundle install, set
gemset... now you can start to make new hobo projects". "add jquery,
add ..." and now you can tackle some more complex projects. And the
regular set of checks on ruby version, gem version, gems, rails
versions, hobo versions; how to keep up to date and how to freeze for
production environments.

# Are there any editors that cope with DRYML?

Textmate:  [hobo-tmbundle](https://github.com/drnic/hobo-tmbundle)

VI: [vim-rails](https://github.com/tpope/vim-rails) &&
[hobo-vim](https://github.com/solars/hobo-vim)

Any other editor that knows how to deal with .html.erb files also
generally works well for DRYML.  Emacs users [have several
choices](http://rinari.rubyforge.org/Rhtml-Setup.html#Rhtml-Setup).
RadRails is also used by others in the community.

# What about security?

*After the latest mass assignment kerfuffle, what needs to be done to
make Hobo resistant to simple attack?*

Hobo adds a permission system to Hobo models that should protect them
from mass assignment vulnerabilities. If you have any models in your
app that are not Hobo models, they may still be vulnerable to the
Rails mass-assignment vulnerability.

# How slow is Hobo?

Hobo in development mode is much slower than vanilla Rails, however in
production mode the speed should be comparable.

Optimizing a Hobo application is very similar to optimizing a Rails
applications -- there are many resources available talking about how
to optimize a Rails application.

There are two major steps to optimizing a Rails application:
optimizing database access and caching.

Optimizing database access is a little bit more difficult in Hobo than
it is in Rails because database access in Hobo is usually implicit. To
optimize, we add an initial efficient explicit access.   For example:

    def show
      self.this = Foo.find(params[:id]).includes(:bar, :bat)
      hobo_show
    end

Make sure that your relationships have the :inverse_of option set on
both ends or this technique will make things worse rather than better.

Caching a Hobo application is much easier than caching a Rails
application. Rails caching is described in the [Caching with Rails
Guide](http://guides.rubyonrails.org/caching_with_rails.html). Page
caching and action caching are identical in both Hobo & vanilla Rails,
but [Hobo adds several tags to make fragment caching much
easier](http://cookbook-1.4.hobocentral.net/api_taglibs/cache).

There will eventually be a blog post and/or manual page or something
describing Hobo 1.4's caching support in more detail. Hopefully soon.

# What's a good development cycle?

e.g. As I was learning, I've found that it paid to do a 'hobo g
migration' pretty much anytime I'd changed a file. Eventually I've
worked out when I *should* do a "hobo g migration", but I wasn't doing
it enough to start with and that caused silly problems.

# What do you need to know about Rails to get started?

and where do you find out more about Rails (and why you'll need to do so)?

# What real websites have been put together with Hobo?

There's an old list here:  http://hobocentral.net/gallery/.   Please
let us know of others!

# How do I deploy to Heroku?

One of the last questions asked by the setup wizard is whether your
application will be deployed to Heroku. If you answer that in the
affirmative, nothing should need to be done. However, if you answered
it in the negative or if it isn't working, there are two changes you
can make to help you run on Heroku or anywhere else with a read-only
file system.

*Check in your autogenerated files*.   The setup wizard may add these two lines to your `.gitignore`:

    app/views/taglibs/auto/**/*
    config/hobo_routes.rb

Remove these lines from `.gitignore`, and check those files in to git.

*config.hobo.read_only_file_system*.   Hobo should autodetect Heroku, but if it fails, add

    config.hobo.read_only_file_system = true

to config/environments/production.rb

# What's the difference between Datamapper and Hobo Fields?

*can I use both?*

# Can Hobo work with legacy databases, and how?

# How do I pass back an extra field from a form?

# Where do I put the DRYML for owner actions?

Owner actions are added to an application like this:

    class CommentsController < ApplicationController
       hobo_model_controller
       auto_actions_for :post, [:index, :new, :create]
    end

The URL for the new action would be:

    /posts/1/comments/new

You can customize the page by creating `app/views/comments/new_for_post.dryml`:

    <new-for-post-page>
      <content-body:>
        ...
      </content-body:>
    </new-for-post-page>

# What does the colon do in DRYML?

*What's the difference between a tag invocation without a colon,
with a colon on the end of the tag name and with a colon in the middle
of the tag name?*

Without any colons, this is an invocation of a DRYML or HTML tag.
For instance `<field-list/>` invokes the `field-list` tag in a fashion
similar to how `<br/>` inserts a break in your HTML.

With a trailing colon, this parameterizes the enclosing tag.

    <page>
      <content-body:>This will appear in the middle of your page</content-body>
    </page>

`content-body` is not a tag in RAPID, it's a parameter to `<page>`.

What sometimes confuses people is the convention in Hobo to make the
parameter names the same as a tag name:

    <form with="&Foo.new">
      <field-list: fields="bar"/>
    </form>

In this `form for="Foo"` has a parameter called `field-list`, which we
are modifying here. It's not a coincidence that the `field-list`
parameter to `form for="Foo"` is implemented via the `field-list` tag
in Hobo.  Therefore this is similar:

    <form with="&Foo.new">
      <field-list fields="bar"/>
    </form>

If you actually try this, the form will look the same, except that it
will be missing its buttons. Why? The previous is actually a short-hand
for

    <form with="&Foo.new">
      <default:>
        <field-list fields="bar"/>
      </default:>
    </form>

In the case of `form for="Foo"`, the default parameter comprises the
entire inner contents of the form, enclosing the three innner
parameters: error-messages, field-list and actions. Our first example
told DRYML to modify the field-list parameter but leave the other two
parameters unchanged. Our last example tells it to replace the default
parameters with a field-list invocation.

There's a third tag invocation form:

    <input:bar/>

This is a shorthand for:

    <input field="bar"/>

Which is similar to:

    <input with="&this.bar"/>

except that the final form loses its place in the context hierarchy.
The context hierarchy is used by `<nested-cache>` as well as for
determining parameter names for inputs in a form.

# Why doesn't Hobo throw an error for an undefined parameter?

A common problem encountered by newcomers to Hobo is mixing up the
parameter and invocation forms. (See previous question). Often this
means that they'll do something like this:

    <form>
      <input: name="foo" value="16"/>
    </form>

`form` doesn't have a parameter named input, so DRYML just silently
ignores it. It would be nice if it gave a nice error instead.

There are several tags that utilize the "unknown parameter" mechanism.
For example, the `<tabs/>` tag in hobo\_jquery\_ui uses it to create
tabs.

But the real reason probably is simply "it's not easy to do, so
nobody's done it yet". If you'd like to take a crack at it, we'd love
to accept a patch request. If we have to reimplement `<tabs>` and
friends, so be it. `<with-fields>` and will have to keep working,
though; there are too many widely used tags that depend on it, such as
`<field-list>` and `<table>`.

Kevin Potter (kevinpfromnm) has a nice way of remembering this
limitation: I think of the parameters as a hash of info passed to the
parent tag method. just like ruby, invalid option names often get
silently dropped. This may or not be the case behind the scenes but
think it's a nice simple way of remembering.

# Why can't I mix parameter and non-parameter tags?

When you have non-parameter tags in a tag call, you're basically
giving the parent a bunch of info in an ordered fashion, a single blob
of text as an example. Parameter tags are more like a hash with the
parameter name being the key, and the content wrapped being the value.
putting the two together provides 1) a problem of figuring out how to
order things, what goes where etc. and 2) a whole slew of potential
for cryptic bugs when the rules run across something unexpected. If
you must, use the default parameter for the stuff you'd want in
non-parameter tags with a word of warning - this can cause weird
behavior as sometimes the default tag wraps other parameters.

# Is DRYML able to be used in Rails without Hobo?

# What dryml view files are available for overriding?

*and when are they used by Hobo (i.e. what cases gets them parsed)? (new.dryml, edit.dryml, show.dryml, index.dryml, new_for_user.dryml, edit_for_user.dryml??? _form.dryml???)*

# How come Hobo doesn't display an input for my `has_one`?

Historically, has_one was a bastard cousin to has_many that made it
difficult to support. We also haven't generally found the need for it,
perhaps because it's not available to us. In the meantime you can
approximate a has_one by using a has_many with validates_length_of to
constrain it to a single item.

That being said, Peter Pavlovich is working on support for has_one.