# Email Predictor

Given these 3 pieces of information:

- An advisor's name
- The domain name of the company he works for
- A set of name's and emails of ther advisors that work for the same company

For this scenario there are 4 potential patterns

1. `first_name_dot_last_name`: "john.ferguson@alphasights.com"
2. `first_name_dot_last_initial`: "john.f@alphasights.com"
3. `first_initial_dot_last_name`: "j.ferguson@alphasights.com"
4. `first_initial_dot_last_initial`: "j.f@alphasights.com"

And given this data:

```ruby
{
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com"
}
```

We have to work out the most likely email address for the following:

1. "Peter Wong", "alphasights.com"
2. "Craig Silverstein", "google.com"
3. "Steve Wozniak", "apple.com"
4. "Barack Obama", "whitehouse.gov"

# Usage

To run the test-suite that covers all 4 occurrences

```bash
$ bundle exec rspec
```

To log into the application's console, set ``CONSOLE`` to ```true``` when running the test suite

```bash
$ CONSOLE=true bundle exec rspec
```

which will boot ```pry``` with the app loaded. Sample execution:

```ruby
prediction = EmailPredictor::Prediction.new("Peter Wong", "alphasights.com")
=> #<EmailPredictor::Prediction:0x00000101e295f8
 @domain=#<EmailPredictor::Domain:0x00000101e29580 @full_domain="alphasights.com">,
 @name=#<EmailPredictor::Name:0x00000101e295a8 @full_name="Peter Wong">>

email = prediction.predicted_email
=> #<EmailPredictor::PredictedEmail:0x00000101d2c2e0 @address="peter.wong@alphasights.com", @pattern=:first_name_dot_last_name>

email.address
=> "peter.wong@alphasights.com"
email.pattern
=> :first_name_dot_last_name
```

## Pattern handling

- For **predominant patterns**: the pattern used will always be the one with more ocurrences on the database

- For **multiple non-predominant patterns**: any of them is used

- For **no previous pattern found** a ```NotImplementedError``` is raised.
