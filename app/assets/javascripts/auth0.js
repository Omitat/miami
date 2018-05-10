$(document).on('turbolinks:load', function() {
  function login() {
    var lock = new Auth0LockPasswordless(
      'Ip8aDyIEjr8d1ssjjrP4r4shQLbgNAYt',
      'scott4044.auth0.com',
      {
        allowedConnections: ['sms'],             // Should match the SMS connection name
        auth: {
          redirectUrl: 'http://localhost:3000/auth/auth0/callback',
          responseType: 'code'
      }
    });
    lock.show();
  };

  $('#login').click(function(e) {
    e.preventDefault();
    login();
  })
});
