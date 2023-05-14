# The Hash Whisperer
The Hash Whisperer figures out where it needs to go by itself. Traversing through arrays, nested hashes, and a bunch of other variables without you needing to travel with it. If you want to give it a map (aka explicit instructions where to drill into), great! Otherwise, just tell it what you're looking for by providing a single key.

## Navigate this README
* [Installation](#installation)
* [Usage](#usage)
* [Object Examples](#object-examples)
* [History](#history)
* [Contributing](#contributing)
* [Alternative Gems](#alternative-gems)

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

## Testing


For security issues, send an email to the address on [this page](https://github.com/ianrandmckenzie).

## Alternative Gems

### [hashie](https://github.com/hashie/hashie)
Hashie is a robust library for managing hashes, including features offered by `the_hash_whisperer` called Deep Fetch:
[https://github.com/hashie/hashie#deepfetch](https://github.com/hashie/hashie#deepfetch)

