# Rails Programming assessment
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
    * Update is so that it **ONLY** shows the logged in user's sites

5. Fix the `Delete` buttons
    * This should remove the site from the displayed sites list, **WITHOUT** reloading the window
      * Clicking this button should delete the site from the database as well

6. Fix the `View` button
    * By clicking on the `View` button of a site card, the app throws an error
    * Update the app to navigate properly, and not throw an error
      * Fix the route in the `sites controller` and add a new template in the `views folder`
    * After fixing the button above, the app should navigate to the newly added template
      * Just create the `show view template` in this step.
      * The next step will define what the template should do and look like

7. Build out the view template for the site's `show method` created in the last step
    * The template should meet these requirements
      * It should show all attributes of the site
        * These attributes should be editable
        * Editing the attributes should save to the database => **persistent**
        * Updates to these attributes should **NOT** require reloading the window
      * It should show a list of pages linked to the site
        * Each page should have an button or link to navigate to a `page show` view template
          * Clicking the link on should navigate to the `page show` view template
        * Each page should have an action to remove to page from the page list
          * This should remove the page from `page list`, **WITHOUT** reloading the window
            * Ensure the method exists in the `Pages controller`
        * There should be an action to create a new page
          * Clicking this action should display a form to input the details for a new page
            * This can be done through a modal, or some other method
          * When saved the new page **SHOULD** be linked to the current site
          * After it's created, the `page list` should update with the new page
            * This should **NOT** require reloading the window

8. Build out a Page view template for the page's `show method`
    * Clicking on the link in the sites `page list` from above should navigate to this template
    * It should show all attributes of the page
      * These attributes should be editable
      * Editing the attributes should save to the database => **persistent**
      * Updates to these attributes should **NOT** require a window reload
    * It should display the image attribute as an **ACTUAL** image, **NOT** just the image url
    * It should display the body content as **ACTUAL** html, not in a string format

9. Add a new migration
    * Pages are linked to a site, but not to a user
    * Create a new migration to link a user to a page
      * The migration should **ALSO** do the following:
        * Find all previously created pages
        * For each page find the site, and add sites user as the user for the page

10. Update the `page controller` index route
  * It should respond to different types of requests
    * For a JSON request it should respond with JSON
    * For an HTML request it should respond with HTML
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
  * Not every change required is outlined above
  * Some tasks require updating multiple files for that task to be completed
  * While css styles, look, and feel are not a priority, the app should look decent