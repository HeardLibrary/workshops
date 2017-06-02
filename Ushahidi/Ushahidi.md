# Ushahidi

### What is [Ushahidi](https://www.ushahidi.com/about)?

Ushahidi, which means 'testimony' or 'witness' in Swahili, was born out of necessity in the wake of the 2008 Kenyan election. Ushahidi was built as means to crowdsource instances of violence following the election.

Since then it has been used to crowd-map events like the 2010 earthquake that devastated Port-au-Prince, Haiti.  Users of Ushahidi were able to pull in tweets and other social media that contained geographic information.


#### Ways to make map submissions:
  * SMS
  * RSS
  * Email
  * Twitter
  * Survey
  * Twilio 

#### Our Ushahidi Deployment

  * vanderbilt.ushahidi.io
    * Email: vanderbilt.crowdmap@gmail.com
    * Twilio: Text 615.200.6985
    * Webform: https://vanderbilt.ushahidi.io/posts/create/1

#### Account set up and data collection
  * Use Ushahidi.io: see [plans](https://www.ushahidi.com/plans)
  * Or set up your own deployment!
  * Free accounts allow you to set up email submissions only
  * For today we will be doing text and email submissions
  * Data comes in as unknown source, and must be formatted to be mapped as a post


#### Setting up a stand alone instances
  * Documentation can be found on GitHub or on the Ushahidi website
  * Anyone can contribute to the project via Github
  * Easiest setup through [Heroku](https://dashboard.heroku.com/apps)
  * Follow the [install directions](https://www.ushahidi.com/support/install-ushahidi#installation-overview)
  * Setup [data sources](https://www.ushahidi.com/support/data-sources#twilio)
   * [Twilio](https://www.twilio.com/console/voice/dev-tools/twiml-apps)
  
#### Critiques
  * Some of the documentation is not clear, so in an emergency situation it may be harder to implement
  * Implementation on heroku takes more time than the hosted implementation
  * May run into problems with Gmail set up
    * in some cases, may need to set up new accounts
  * Requires post-processing of data from email and text data--- web form seems to be best, but may not be available in all scenarios
  
#### Let's Build an Account!
  * [Create and account](https://ushahidi.io/create?tier=free)
  * Add you email
    * Be careful about gmail settings, certain security settings must be turned off in order for this method to work
  * Create a survey
  * Add a point!
  
