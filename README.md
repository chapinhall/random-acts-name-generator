# random-acts-name-generator

This was an idea first hatched by Dana Weiner in January 2019 as part of wellness month, riffing on secret santa-style randomizers that had been created by Habitat.

It was refreshed in Spring 2024 in discussion with Chapin's Culture and Climate Committee, and hopefully can be maintained and enjoyed for many years.

The list of Chapin Hall staff are currently updated manually by going to the [Staff Directory on The Hall](https://chapinhall.sharepoint.com/sites/TheHall-Home/Lists/Staff%20Directory/Alpha.aspx), exporting a csv with all the names, saving it in the local code repository, and pointing the `app.R` script to that file name before redeploying this app.

An alternative to consider would be if R's driver for the Selenium WebDriver RSelenium ([link to package documentation](https://www.rdocumentation.org/packages/RSelenium/), [sample tutorial](https://thatdatatho.com/tutorial-web-scraping-rselenium/)) to automatically pull that roster when launched by the user. Note: this may require some way to handle credentials or access, although all likely users would have such credentials.
