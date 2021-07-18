# Karate
## About karate
Karate is the only open-source tool to combine API test-automation, mocks and performance-testing into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Besides powerful JSON & XML assertions, you can run tests in parallel for speed - which is critical for HTTP API testing.

You can easily build (or re-use) complex request payloads, and dynamically construct more requests from response data. The payload and schema validation engine can perform a 'smart compare' (deep-equals) of two JSON or XML documents, and you can even ignore dynamic values where needed.

Test execution and report generation feels like any standard Java project. But there's also a stand-alone executable for teams not comfortable with Java. Just write tests in a simple, readable syntax - carefully designed for HTTP, JSON, GraphQL and XML.

Visit the [karate github repo](https://github.com/intuit/karate) fore more information.
## How to use karate
The examples in this repository are setup to run with the stand-alone executable, in VS Code or in IntelliJ.

Spin up your test environment in local environment or a test environment of your choice.
### Standalone JAR
1. Follow [these instructions](https://github.com/intuit/karate/tree/master/karate-netty#standalone-jar) to download and "install" the stand-alone executable to a local directory of your choice
1. Pull the tests in this repository to your local machine
1. Update `karate-config.js` file for your project with the environment you wish to test against `TODO: Currently just override the value in the IF statement... need to figure out how to set MAVEN environment variables`
1. Run a test with `java -jar /your/path/to/karate-x.x.x.jar /your/path/to/*.feature`
### VS Code
1. Install the [Karate Runner extension](https://marketplace.visualstudio.com/items?itemName=kirkslota.karate-runner)
### IntelliJ
1. This project needs to be imported into IntelliJ using the `maven` archetype
1. Copy and update the file `config-dev.yaml` as `config-staging.yaml` if you want to run tests against an environment named staging
Detailed instructions are available [here](https://github.com/intuit/karate#maven)
### Maven
1. Copy and update the file `config-dev.yaml` as `config-staging.yaml` if you want to run tests against an environment named staging
1. Run the test using `mvn test -DargLine="-Dkarate.env=dev"`
Detailed instructions are available [here](https://github.com/intuit/karate/tree/master/#switching-the-environment)
