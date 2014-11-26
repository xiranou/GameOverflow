# Review

## Startup

Got it going without a hitch. Cool.

You should not be committing your `.DS_Store`. Add it to both your local and global `.gitignore` files.

## Design

8-bit awesomesauce. I like the navigation and even the old-school forum feel.

I'm curious about what happens to the nav when you have more than 20 games or consoles or genres. It would also be nice if clicking the logo on the left-hand side brought you back to some kind of homepage. That's become an expected part of the user experience. This is me nitpicking, though.

Last nitpick: remove the bullet points from the comment list-items.

## Core Function

This is a great implementation of a basic CRUD app.

Some questions:
* If articles can be created without being linked to a game, console, or genre, what happens when they are no longer recently added? How are they found?
* There is no functionality to create new games, consoles, or genres currently, which limits the use of the app.

## Tests

Wowza, tests galore. I'm glad you got the learning experience of writing them in. Your CI setup looks great, and it looks like for the most part you kept the tests passing. Fabulous. I would have loved to see simplecov set up, too.

I'm glad you got the work in, but most of your tests are only checking that the basic functionality of AR validations & associations works. Given the fact that most of your models are only that, it makes sense, but in future you'll need to be much more thoughtful about the whys and whens of testing. The only non AR function you have, Article#content_preview, goes untested.

## Models

Again, the models are pretty bare. Nice use of custom associations.

## Controllers

You've captured a lot of actions in the controllers that aren't actually necessary to your app as it currently exists. If there is no way for users to make a new game, genre, or console - why are there #new and #create actions for those three models?

If code isn't necessary, it shouldn't be on master. Period.

## Views

Similarly, there are a bunch of just empty files here. It's a confusing distraction from your intentions, your code and the work it's doing.

Great use of partials, though, and a nice understanding of Rails helper functions.

## JS & CSS

No JS at all?? User experience is important. AJAXify something, y'all. Anything.

CSS manifest looks solid. Nice work, there. You may want to move the reset to the vendor/assets/stylesheets folder instead.

## Migrations

Nice use of polymorphic associations. You need to add constraints to your tables, though. Should a comment be able to exist without a commenter? A genre without a name? Add some constraints to your database to keep it from being filled with crappy, unusable data.
