# Bookmark Manager


Build a bookmark manager that stores a collection of bookmarks as
URLs.


 
## User Stories

 ```
 As a user,
 So I can view my most-used websites,
 I want to view a list of bookmarks

 As a user,
 So I can retrieve my most-used websites at a later date,
 I want to to be able to store these websites 

 As a user,
 So I can remove my bookmark from the Bookmark Manager,
 I want to delete a bookmark

 As a user,
 So I can change a bookmark in Bookmark Manager,
 I want to update a bookmark

 As a user,
 So that the bookmarks I save are useful,
 I want to only save a valid URL

 As a user,
 So that I can describe what the bookmarks are
 I want to be able to add a comment or comments to a bookmark

 As a user,
 So that I can categorize my bookmarks,
 I want to add a tag to a bookmark
 ```
 



 ## Databases Setup

 * **Connect to psql:**

 ```
 brew install postgresql

 brew services start postgresql

 psql postgres
 ```

 * **Create the database and test database:**

development database:

```html
CREATE DATABASE bookmark_manager_new;
```

test database:

```html
CREATE DATABASE bookmark_manager_new_test;
```

Connect to the database

```html
\c bookmark_manager_new;
```

Run the following migrations. which can be found in the db/migrations subfolder: 

```html
 CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```
```html
 CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```
```html
 ALTER TABLE bookmarks ADD COLUMN title VARCHAR(30);
```
```html
 CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));
```
```html
 ALTER TABLE comments ADD description text;
```
```html
 ALTER TABLE comments DROP COLUMN text;
```
```html
 CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60));
```
```html
 REATE TABLE bookmarks_tags(tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));
``` 

Repeat for the test database

### How to use:

**Clone this repository:**

```html
git clone https://github.com/emilyjspencer/Bookmarks.git
```

**cd into the repo**

**Run**

```html
bundle install
```

**Start the server:**

```html
rackup
```

**Go to localhost:9292**

### How to run the tests:

```html
rspec
```

### Built with:

* Ruby
* Sinatra
* HTML/CSS
* SQL

### Tested with:

* RSpec
* Capybara

### What it looks like:


