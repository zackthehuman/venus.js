<!DOCTYPE html>
<html>
<head>
  <title>Venus Test Harness </title>
  <!--[if lte IE 7]>
  <script type="text/javascript" src="/js/json2.js"></script>
  <![endif]-->
  <script type="text/javascript" src="/js/jquery/jquery-1.10.0.min.js"></script>
  <script type="text/javascript" src="/js/underscore/underscore-min.js"></script>
  <script type="text/javascript" src="/js/socketio/socket.io.min.js"></script>
  <script type="text/javascript" src="/js/runner_client/VenusClientLibrary.js"></script>
  <script type="text/javascript" src="/js/runner_client/VenusUi.js"></script>
  <script type="text/javascript" src="/js/runner_client/venus.js"></script>
  <script type="text/javascript">
    window.venus.postUrl = '{postTestResultsUrl}';
    window.venus.fixtureReset = Boolean({fixtureReset});
    window.venus.testId  = {testId};
  </script>
  <link rel="stylesheet" type="text/css" href="/css/app.css">
  <link rel="icon" type="image/png" href="/img/favicon.ico">

</head>
<body>
  <nav>
    <ul>
      <li class="selected"><a href="#" id="results-button">Test Results</a></li>
      <li><a href="#" id="sandbox-button">Fixtures</a></li>
    </ul>
  </nav>

  <section id="content">
    <section id="results-view">
    </section>

    <section id="sandbox-view">
      <iframe src="{testSandboxUrl}" id="sandbox"></iframe>
      <!--Running test: {testId}-->
    </section>
  </section>

  <script type="text/html" id="results-template">
      <h1><%= group.name %></h1>
      <ul class="test-list">
        <% for (var i = 0, len = group.tests.length; i < len; ++i) { %>
          <% if (group.tests[i].status === 'PASSED') { %>
            <li class="pass">
              <ul>
                <li class="summary">✓ <%= group.tests[i].message %></li>
              </ul>
            </li>
          <% } else { %>
            <li class="fail">
              <ul>
                <li class="summary">X <%= group.tests[i].message %></li>
                <li class="details"><pre><%= group.tests[i].stackTrace %></pre></li>
              </ul>
            </li>
          <% } %>
        <% } %>
      </ul>

  </script>
</body>
</html>
