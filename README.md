# Rails Programming Task
*Note: This task should take no longer than 4 hours at the most to complete.*

### Versions
* Rails 6
* Ruby 2.6.1
* Postgres 11
* Git <Any>

### Prerequisites

* You will need the following installed:
  * [Ruby on Rails](http://www.rubyonrails.org/)
  * [Ruby](https://www.ruby-lang.org/en/)
  * [Postgres](https://www.postgresql.org/)
  * [Git](https://git-scm.com/)

### Installation
  * Clone this repo
    * `git clone  https://github.com/simpleviewinc/zr-rails-test`
  * Install the gems
    * `./bin/bundle exec install`
  * Setup the DB
    * `bin/rails db:create && bin/rails db:migrate`
  * Get the project running
    * `bin/bundle exec puma -C config/puma.rb`

### Tasks

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
    * This should remove the site from displayed sites list, **WITHOUT** reload the window
      * Clicking this button should delete the site from the database

6. Fix the `View` button
    * By clicking on the `View` button of a site card, the app throws an error
    * Update the app to navigate properly, and not throw an error
      * Fix the route in the `sites controller` and add a new template in the `views folder`
    * After fixing the button above, the app should navigate to the newly added template
      * Just create the `view template file` in this step.
      * The next step will define what the template should do and look like

7. Build out the view template for the site's `show method` created in the last step
    * The template should meet these requirements
      * It should show all attributes of the site
        * These attributes should be editable and **persistent**
          * Editing the attributes should save to the database
          * More routes and controller methods will be needed
        * Updates to these attributes should **NOT** require reloading the window
      * It should show a list of pages linked to the site
        * Each page should have an button / link to navigate to a page `show view`
          * Clicking the link on should navigate to the `page show view` for that page
            * Ensure the method exists in the `Pages controller`
            * Create a new template in the `views folder`
        * Each page should have an action to remove to page from the page list
          * This should remove the page from page list, **WITHOUT** reloading the window
            * Ensure the method exists in the `Pages controller`
        * There should be an action to create a new page
          * Clicking this action should display a form to input the details for a new page
            * This can be done through a modal, or some other method
          * When saved the new page **SHOULD** be linked to the current site
          * After it's created, the page list should update with the new page
            * This should **NOT** require reloading the window

8. Build out a Page view template for the page's `show method`
    * Clicking on the link in the sites page list from above should navigate to this template
    * It should show all attributes of the page
      * These attributes should be editable and **persistent**
        * Editing the attributes should save to the database
      * Updates to these attributes should **NOT** require a window reload
    * It should display the image attribute as an **ACTUAL** image, **NOT** just the image url
    * It should display the body content as **ACTUAL** html, not in a string format
      * Bonus points for ensuring the html content is safe

9. Add a new migration
    * Pages are linked to a site, but not to a user
    * Create a new migration to link a user to a page
      * The migration should **ALSO** find all previously created pages and do the following
        * Find the user of that page's site, and add that user as the user for the page

10. Update the `page controller` index route
  * It should respond to different types of requests
    * For JSON request it should respond with JSON
    * For HTML request it should respond with HTML
  * Add a view template that displays a list of pages created by the user
    * Add a button to the `_navbar.html.erb` template the navigates to this view template

## Important
  * Not every change required is outlined above
  * Some tasks require updating multiple files for that task to be completed
  * While css styles, look, and feel are not a priority, the app should look decent

### Submit
  * Submit a pull request to this repo
  * Send an us an email, letting us know it has been submitted
  * Deploy the app to the cloud
    * How this is done is not important. It just needs to be accessible via the internet