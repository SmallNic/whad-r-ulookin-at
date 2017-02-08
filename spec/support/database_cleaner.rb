RSpec.configure do |config|


  #Before the entire test suite runs, clear the test DB out completely. This gets rid of any garbage left over from interrupted or poorly-written tests.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  #Set the default DB cleaning strategy to be transactions. Transactions are very fast, and for all the test wherer they do work -- that is, any test where the entire test runs in the RSPEC process -- they are preferable
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # This line only runs before examples which have been flagged :js => true. By default these are the only tests for which Capybara fires up a test server process and drives an actual browswer window via the Selenium backend. For these types of tests, transactions won’t work, so this code overrides the setting and chooses the “truncation” strategy instead.
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  #Hook up database_cleaner to the beginning and end of each test.
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

end
