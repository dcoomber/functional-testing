function fn() {
  var env = karate.env; // get java system property 'karate.env'

  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }

  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.log('Environment used for testing is:', env);

  var config = { };
  return config;
}
