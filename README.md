# The Hash Whisperer
The n+1 brute force machine for getting what you want from a Hash or JSON. This project was inspired by the creation of a (now long dead) social media aggregator app and being sick of how tedious it was parsing through enormous, confusing hashes and json responses.

This library is probably not very efficient, but if you're a new developer working with APIs, it will save you a lot of grief and help you get your API-related college project finished.

## Installation

Add this line to your application’s Gemfile:

```ruby
gem "the_hash_whisperer"
```

Or, for non-framework projects, simply type this into your terminal:

```bash
gem install the_hash_whisperer
```

## Usage
The Hash Whisperer figures out where it needs to go by itself. Traversing through arrays, nested hashes, and a bunch of other variables without you needing to travel with it. If you want to give it a map (aka explicit instructions where to drill into), great! Otherwise, just tell it what you're looking for by providing a single key.

See [the example data near the bottom of this README](#object-examples) for reference to the objects the code examples are using.

### Get all values identified by a specified a key
```ruby
# Ruby Hash
hash_whisperer = TheHashWhisperer.new(your_hash)
values = hash_whisperer.find_all_values_for('title')

# JSON
json_whisperer = TheHashWhisperer.new(your_valid_json, true)
values ||= json_whisperer.find_all_values_for('title')

values
# => ["Example Article Title 1", "Example Article Title 2", "Example Comment Title 1"]
```

### Get all values specified by a direct path to that key
```ruby
# Ruby Hash
hash_whisperer = TheHashWhisperer.new(your_hash)
values = hash_whisperer.drill_into_and_find('data.articles.comments.title')

# JSON
json_whisperer = TheHashWhisperer.new(your_valid_json, true)
values ||= json_whisperer.drill_into_and_find('data.articles.comments.title')

values
# => ["Example Comment Title 1"]
```

### Yes, it works for the shallower paths, too
```ruby
# Ruby Hash
hash_whisperer = TheHashWhisperer.new(your_hash)
values = hash_whisperer.drill_into_and_find('data.articles.title')

# JSON
json_whisperer = TheHashWhisperer.new(your_valid_json, true)
values ||= json_whisperer.drill_into_and_find('data.articles.title')

values
# => ["Example Article Title 1", "Example Article Title 2"]
```

## Object Examples

### Ruby Hash
```ruby
{
  data: {
    articles: [
      {
        title: 'Example Article Title 1',
        body: 'This is a stub.',
        comments: [
          {
            title: 'Example Article Comment Title 1',
            body: 'Why are all your articles just stubs?'
          }
        ]
      },
      {
        title: 'Example Article Title 2',
        body: 'This is a stub.',
        comments: []
      }
    ]
  }
}
```

### JSON
```json
{
  "data": {
    "articles": [
      {
        "title": "Example Article Title 1",
        "body": "This is a stub.",
        "comments": [
          {
            "title": "Example Article Comment Title 1",
            "body": "Why are all your articles just stubs?"
          }
        ]
      },
      {
        "title": "Example Article Title 2",
        "body": "This is a stub.",
        "comments": []
      }
    ]
  }
}
```


## History

View the [changelog](https://github.com/ianrandmckenzie/the_hash_whisperer/blob/main/CHANGELOG.md)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ianrandmckenzie/the_hash_whisperer/issues)
- Fix bugs and [submit pull requests](https://github.com/ianrandmckenzie/the_hash_whisperer/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development and testing:

```sh
git clone https://github.com/ianrandmckenzie/the_hash_whisperer.git
cd the_hash_whisperer
bundle install
bundle exec rake test
```

For security issues, send an email to the address on [this page](https://github.com/ianrandmckenzie).
