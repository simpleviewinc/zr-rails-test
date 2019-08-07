# Rails Programming Assessment
*This assessment should take around 5 hours complete.*

## Versions
* Rails 6
* Ruby 2.6.1
* Postgres 11
* Git *Any*

## Prerequisites

* You will need the following installed:
  * [Ruby on Rails](http://www.rubyonrails.org/)
  * [Ruby](https://www.ruby-lang.org/en/)
  * [Postgres](https://www.postgresql.org/)
  * [Git](https://git-scm.com/)

## Installation
  * Clone this repo
    * `git clone  https://github.com/simpleviewinc/zr-rails-test`
  * Install the gems
    * `./bin/bundle exec install`
  * Setup the DB
    * `bin/rails db:create && bin/rails db:migrate && bin/rails db:seed`
  * Get the project running
    * `bin/bundle exec puma -C config/puma.rb`
  * `./run.sh` - Is a bash helper script to run the above commands *optional*
    * Requires a unix terminal *will not work on windows*
    * Example => `bash ./run.sh ...params`

## Tasks

1. Setup the environment
    * Use the commands listed in the `Installation` section above

2. Open your browser to localhost:3000
    * If running the project locally

3. The clean up the sites index page
    * The page currently shows `List of sites / No Sites exist` and the `Please Login` sections.
      * Update the erb template so that
        * The `Please Login` section shows **ONLY** when a user  **IS NOT** logged in
        * The `List of sites` section shows **ONLY** when a user **IS** logged in

4. The site index shows all sites
    * Update the app so that it **ONLY** shows the logged in user's sites

5. Fix the `Delete` buttons
    * This should remove the site from the displayed sites list, **WITHOUT** reloading the window
    * Clicking this button should delete the site from the database

6. Fix the `View` button
    * When clicking on the `View` button of a site card, the app throws an error
    * Add a new `show view template`
    * After clicking on the the `View` button, the app should navigate to the new `show view template`

7. Build out the `show view template` created in the last step
    * The template should meet these requirements
      * Show all attributes of a site
        * Attributes should be editable
        * Editing the attributes should be **persistent**
        * Site attribute updates should **NOT** require reloading the window
      * Show a list of pages linked to the site
        * Each page should have
          * A button or link to navigate to a `page show view template` 
          * A button or link to remove to page from the page list
            * This should remove the page from `page list`, **WITHOUT** reloading the window
            * this should be **persistent**
        * There should be a button or link to create a new page
          * Clicking this action should display a form to input the details for a new page
          * When saved the new page **SHOULD** be linked to the current site
          * After it's created, the `page list` should update with the new page
            * This should **NOT** require reloading the window

8. Build out the `page show view template` 
    * Clicking on the link in the sites `page list` from above should navigate to this template
    * The template should meet these requirements
      * Show all attributes of a page
        * Attributes should be editable
        * Editing the attributes should be **persistent**
        * Page attribute updates should **NOT** require reloading the window
      * Display the image attribute as an **ACTUAL** image, **NOT** just the image url
      * Display the body content as **ACTUAL** html, not in a string format

9. Add a new migration
    * The migration should meet these requirements
      * Link a user to a page
      * User should be added when the page is created
      * For all previously created pages
        * Find the linked site, add the sites user as the user for the page

10. Update the `page controller` index route
    * It should respond to different types of requests ( JSON && HTML )
    * Add a view template that displays a list of pages created by the logged in user
      * Add a button to the `_navbar.html.erb` template that navigates to this view template

11. Build out a page `index view template` for the page's `index method`
    * Display only the pages of the logged in user
    * The Page list should emulate the `page list` on the sites `show view template` from step 7
      * The **ONLY** difference is that each page should include a link to it's parent site
        * The link should navigate to the sites `show view template`

12. Add a search input at the top of the `page list`
    * The `page list` should update in real time as input is typed into the search input
    * The search should filter by name of the page
    * It should filter out any non-matching pages in the `page list`


## Submit
  * Submit a pull request to this repo
  * Send an us an email, letting us know it has been submitted
  * Deploy the app to the cloud
    * How this is done is not important. It just needs to be accessible via the internet

## Important
  * Not every change required is outlined above. We want to see how you would do it
  * Some tasks require updating multiple files for that task to be completed
    * Don't be afraid to add, move, or change parts of the app. Show us what you can do
  * Your are encouraged to **show your work** through comments
    * You don't have to comment every little change, but we would like to see your thought process
  * While css styles, look, and feel are not a priority, the app should look decent
