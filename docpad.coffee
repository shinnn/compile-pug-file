# Export our DocPad Configuration
module.exports = {

  # =================================
  # Template Data
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ
  
  documentsPaths: [
    'documents'
    'pages'
  ]
  
  layoutsPaths: [
    'layouts'
    'templates'
  ]

  templateData:

    # Specify some site properties
    site:
      # The production url of our website
      url: "http://website.com"

      # The default title of our website
      title: "Website"

      # The website description (for SEO)
      description: """
        When your website appears in search results in say Google, the text here will be shown underneath your website's title.
        """

      # The website keywords (for SEO) separated by commas
      keywords: """
        design, web, portfolio
        """

      # The website's styles
      styles: [
        '/vendor/normalize.css'
        '/vendor/h5bp.css'
        '/styles/style.css'
      ]

      # The website's scripts
      scripts: [
        '/vendor/log.js'
        '/vendor/modernizr.js'
        '/scripts/script.js'
      ]

    # -----------------------------
    # Helper Functions

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
      # if our document does not have it's own title, then we should just use the site's title
      else
        @site.title

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site's description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')

  # =================================
  # DocPad Events

  # Here we can define handlers for events that DocPad fires
  # You can find a full listing of events on the DocPad Wiki
  events:

    # Server Extend
    # Used to add our own custom routes to the server before the docpad routes are added
    serverExtend: (opts) ->
      # Extract the server from the options
      {server} = opts
      docpad = @docpad

      # As we are now running in an event,
      # ensure we are using the latest copy of the docpad configuraiton
      latestConfig = docpad.getConfig()

  # =================================
  # Plugin Configuration

  plugins:
    jade:
      pretty: true
      debug: true
}
