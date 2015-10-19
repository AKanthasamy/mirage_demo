# Mirage Demo

This demo shows how [Mirage](https://github.com/SpectoLabs/mirage) can "record" how a third-party service responds to an application, and then mimic the third-party service by "playing back" the recorded responses.

Please refer to the [Mirage documentation](https://github.com/SpectoLabs/mirage/wiki) for more information. The [Introduction](https://github.com/SpectoLabs/mirage/wiki/Introduction) is a good place to start.

## Installation

You need Docker and docker-compose, and a Twitter API key pair.

Set environment variables:

```bash
export TwitterKey=<twitter key>
export TwitterSecret=<twitter secret>
```

Clone the repository:
```bash
git clone https://github.com/SpectoLabs/mirage_demo.git && cd mirage_demo
```

Get the applications:

```bash
git submodule init && git submodule update
```

Launch:

```bash
./up.sh

```

Mirage application: http://{boot2docker-ip}:8001

Twitter Search (demo application): http://{boot2docker-ip}:8080

Proxy application: http://{boot2docker-ip}:8300/admin  


To update the mirage, twitter-app and twitter-proxy modules:

```bash
git submodule foreach git pull origin master
```

## Usage


> **Note:** After running the up.sh script, you will see the logging output of each application in your terminal window. This will allow you to see what's going on behind the scenes. For a more user-friendly output, you can use [Kitematic](https://kitematic.com/) from Docker which allows you to see the logging output from each individual application in its own window.


In this demo, we are testing a simple application called "Twitter Search". This application allows you to submit a search term to the Twitter search API, and displays the results in JSON format.

You can find more information on the [Mirage testing workflow in the Mirage docs](https://github.com/SpectoLabs/mirage/wiki/Testing-Workflow).

The Twitter Search application has a drop down selector ("External API URI") which allows you to choose whether API calls are routed straight to Twitter, or via Mirage.

There is also an input field where you can set the name of the Mirage scenario and session.

Normally these two options would be set in a configuration file, but we've put them in the application UI for the purposes of this demo.  

![demo_twitter_search_initial](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_initial.png)

With the External API URI selector set to "Twitter", you can submit a search query and view the response.

![demo_twitter_search_response](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_response.png)

The Twitter Search application is calling the real Twitter search API, which returns a real-time response.

Next, we will configure Mirage to record how the Twitter search API responds when the Twitter Search application calls it.

In the Mirage management UI, navigate to Management > Scenarios and click the "Add a new scenario" button.

You can find more information on [sessions and scenarios in the Mirage docs](https://github.com/SpectoLabs/mirage/wiki/Glossary).

![demo_mirage_add_new_scenario](https://storage.googleapis.com/specto-wiki-img/demo_mirage_add_new_scenario.png)

We check the "Start session in record mode..." box so that once we click the "Submit" button, everything is ready for recording.

![demo_mirage_view_session_record](https://storage.googleapis.com/specto-wiki-img/demo_mirage_view_session_record.png)  

Mirage uses proxies to handle the routing of requests and responses. You can find out more about this in the Mirage docs.

For this demo, we have a simple proxy that sits between the Twitter Search application and Mirage itself.

The proxy can be set to either record or playback mode. By default, our proxy is in record mode. You can see that in record mode, the proxy gets responses from the real Twitter API at https://api.twitter.com.

![demo_proxy_record_mode](https://storage.googleapis.com/specto-wiki-img/demo_proxy_record_mode.png)

Now we return to the Twitter Search application and select "Mirage Proxy" in the "External API URI" selector. We enter the name of the scenario and session that we set up in the Mirage management UI and submit a search term. The response is still coming from the real Twitter search API, but it is being routed through the proxy.

![demo_twitter_search_proxy](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_proxy.png)

If we go back to the Mirage management UI and navigate to the Tracker Collection page, we can see that the Twitter search API response has been recorded.

![demo_mirage_response_recorded](https://storage.googleapis.com/specto-wiki-img/demo_mirage_response_recorded.png)

Now we have recorded a response, we want to switch Mirage into playback mode. In the Mirage application, we navigate to Management > Scenarios and click the "Stop" button next to our scenario. The recording session stops, and we can click the "play" button to start playback.

![demo_mirage_start_playback](https://storage.googleapis.com/specto-wiki-img/demo_mirage_start_playback.png)

We also need to switch the proxy into playback mode. We go to the Proxy application and click the "Recording" button to switch the proxy into playback mode. You can see that the Proxy is now getting responses from the Mirage Application at http://mirage_app:8001.

![demo_proxy_playback_mode](https://storage.googleapis.com/specto-wiki-img/demo_proxy_playback_mode.png)

Now we return to the Twitter Search application and submit our search term again. The Twitter Search application is calling Mirage, which is returning the recorded response.

![demo_twitter_search_proxy](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_proxy.png)

If we go back to the Mirage application and navigate to the Tracker Collection page, we can see that Mirage is now mimicking the Twitter search API.

![demo_mirage_playback_response](https://storage.googleapis.com/specto-wiki-img/demo_mirage_playback_response.png)

If you click the "Details" button next to one of the responses, you can see more information about the request that Mirage received and the response that it returned.

![demo_mirage_playback_details](https://storage.googleapis.com/specto-wiki-img/demo_mirage_playback_details.png)  

During the recording session, we only entered one search term, so Mirage only recorded one response. If we return to the Twitter Search application and submit a different search term, we see that Mirage cannot find the correct response for the request.

![demo_twitter_search_no_match](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_no_match.png)  

However, Mirage can use partial matching - meaning that one request can have multiple possible responses. More on this later.
