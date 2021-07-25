**PART 1: TDD RSPEC :** 

**SET UP AND INSTALLATION FOR RSPEC:** 
gem install rspec
bundle install
rails generate rspec:install



**The files where the TDD was accomplished :** 
--/lib/elevator_media/Streamer.rb 
-- /spec/lib/elevator_media/streamer_spec.rb 
-- /spec/controllers/Interventions_controller_spec.rb
-- /spec/controllers/Leads_controller_spec.rb
-- /spec/controllers/Quotes_controller_spec.rb

RED-GREEN-REFACTOR METHOD DESCRIPTION :
All the 11 tests (although some patterns are repetitive) were realized with the Ref-Green-Refactor method. Here are a few examples :

-the "getContent behavior" described first test  was meant to check if getContent returned valid html content. I did not include an html tag in the "include: (like the </div> one) to make the test fail, then added the </div> tag to make sure my content was HTML.


## For Testing

- To run all tests :

```sh
rspec --format documentation
```

- Test : ./spec/lib/elevator_media/streamer_spec.rb

```sh
rspec ./spec/lib/elevator_media/streamer_spec.rb
```

- Test : ./spec/controllers/Interventions_controller_spec.rb

```sh
rspec ./spec/controllers/Interventions_controller_spec.rb
```

- Test : ./spec/controllers/Leads_controller_spec.rb

```sh
rspec ./spec/controllers/Leads_controller_spec.rb
```

- Test : ./spec/controllers/Quotes_controller_spec.rb

```sh
rspec ./spec/controllers/Quotes_controller_spec.rb
```
**PART 2: TDD JEST/JS :**

**SET UP AND INSTALLATION FOR JEST:**
1. npm install
2. npm install jest
3. create streamer.js
4. create streamer.test.js

**To Run JEST test:**
npm run test

After testing it is too messy to have both in same folder so I decided to have Jest on a separate folder.  