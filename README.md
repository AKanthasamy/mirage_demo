# Mirage Demo

This demo shows how [Mirage](https://github.com/SpectoLabs/mirage) can "record" responses from a third-party service, and then mimic the third-party service by "playing back" the recorded responses.

Please refer to the [Mirage documentation](https://github.com/SpectoLabs/mirage/wiki) for more information. The [introduction](https://github.com/SpectoLabs/mirage/wiki/Introduction) is a good place to start.

## Demo Structure

This demo is comprised of 3 main parts (4 if you count the dependency, in this case api.twitter.com):

- The Mirage server, on [http://localhost:8001](http://localhost:8001)
- The Twitter App, on [http://localhost:8080](http://localhost:8080)
- The Twitter Proxy, on [http://localhost:8300/admin](http://localhost:8300/admin)

<div class="flow-chart"><svg height="322.0546875" version="1.1" width="344.52734375" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><path stroke-linecap="round" d="M5,0 0,2.5 5,5z" id="raphael-marker-block" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><marker id="raphael-marker-endblock33-obj635" markerHeight="3" markerWidth="3" orient="auto" refX="1.5" refY="1.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#raphael-marker-block" transform="rotate(180 1.5 1.5) scale(0.6,0.6)" stroke-width="1.6667" fill="black" stroke="none" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></use></marker><marker id="raphael-marker-endblock33-obj636" markerHeight="3" markerWidth="3" orient="auto" refX="1.5" refY="1.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#raphael-marker-block" transform="rotate(180 1.5 1.5) scale(0.6,0.6)" stroke-width="1.6667" fill="black" stroke="none" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></use></marker><marker id="raphael-marker-endblock33-obj638" markerHeight="3" markerWidth="3" orient="auto" refX="1.5" refY="1.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#raphael-marker-block" transform="rotate(180 1.5 1.5) scale(0.6,0.6)" stroke-width="1.6667" fill="black" stroke="none" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></use></marker></defs><rect x="0" y="0" width="92.453125" height="39" rx="0" ry="0" fill="#ffffff" stroke="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" stroke-width="2" class="flowchart" id="st" transform="matrix(1,0,0,1,42.3008,26.7637)"></rect><text x="10" y="19.5" text-anchor="start" font-family="sans-serif" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: start; font-family: sans-serif; font-size: 14px; font-weight: normal;" id="stt" class="flowchartt" font-weight="normal" transform="matrix(1,0,0,1,42.3008,26.7637)"><tspan dy="5.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Twitter App</tspan></text><path fill="#ffffff" stroke="#000000" d="M42.263671875,21.1318359375L0,42.263671875L84.52734375,84.52734375L169.0546875,42.263671875L84.52734375,0L0,42.263671875" stroke-width="2" font-family="sans-serif" font-weight="normal" id="have" class="flowchart" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: sans-serif; font-weight: normal;" transform="matrix(1,0,0,1,4,119.7637)"></path><text x="47.263671875" y="42.263671875" text-anchor="start" font-family="sans-serif" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: start; font-family: sans-serif; font-size: 14px; font-weight: normal;" id="havet" class="flowchartt" font-weight="normal" transform="matrix(1,0,0,1,4,119.7637)"><tspan dy="5.513671875" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Twitter Proxy</tspan></text><rect x="0" y="0" width="115.015625" height="39" rx="0" ry="0" fill="#ffffff" stroke="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" stroke-width="2" class="flowchart" id="login" transform="matrix(1,0,0,1,31.0195,281.0547)"></rect><text x="10" y="19.5" text-anchor="start" font-family="sans-serif" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: start; font-family: sans-serif; font-size: 14px; font-weight: normal;" id="logint" class="flowchartt" font-weight="normal" transform="matrix(1,0,0,1,31.0195,281.0547)"><tspan dy="5.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">api.twitter.com</tspan></text><rect x="0" y="0" width="61.890625" height="39" rx="0" ry="0" fill="#ffffff" stroke="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);" stroke-width="2" class="flowchart" id="details" transform="matrix(1,0,0,1,280.6367,142.5273)"></rect><text x="10" y="19.5" text-anchor="start" font-family="sans-serif" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: start; font-family: sans-serif; font-size: 14px; font-weight: normal;" id="detailst" class="flowchartt" font-weight="normal" transform="matrix(1,0,0,1,280.6367,142.5273)"><tspan dy="5.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Mirage</tspan></text><path fill="none" stroke="#000000" d="M88.52734375,65.763671875C88.52734375,65.763671875,88.52734375,105.41777181625366,88.52734375,116.76411095960066" stroke-width="2" marker-end="url(#raphael-marker-endblock33-obj635)" font-family="sans-serif" font-weight="normal" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: sans-serif; font-weight: normal;"></path><path fill="none" stroke="#000000" d="M88.52734375,204.291015625C88.52734375,204.291015625,88.52734375,263.8529648706317,88.52734375,278.0454605893174" stroke-width="2" marker-end="url(#raphael-marker-endblock33-obj636)" font-family="sans-serif" font-weight="normal" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: sans-serif; font-weight: normal;"></path><text x="93.52734375" y="214.291015625" text-anchor="start" font-family="sans-serif" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: start; font-family: sans-serif; font-size: 14px; font-weight: normal;" font-weight="normal"></text><path fill="none" stroke="#000000" d="M173.0546875,162.02734375C173.0546875,162.02734375,260.22450147685595,162.02734375,277.6329262407886,162.02734375" stroke-width="2" marker-end="url(#raphael-marker-endblock33-obj638)" font-family="sans-serif" font-weight="normal" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: sans-serif; font-weight: normal;"></path><text x="178.0546875" y="152.02734375" text-anchor="start" font-family="sans-serif" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: start; font-family: sans-serif; font-size: 14px; font-weight: normal;" font-weight="normal"><tspan dy="5.51171875" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></tspan></text></svg></div>

It's actually more complicated if you count in Redis, Mongo etc. let us not forget it's all wrapped inside docker too. But for now these are the parts we shall be working with.

## Installation

> These instructions are for OSX and Linux only at the moment as Docker Compose is not yet available for Windows. There is an [open issue](https://github.com/SpectoLabs/mirage_demo/issues/3) to add a Vagrantfile which will allow Windows users to run the demo applications.

You need Docker, Docker Compose and a Twitter API key pair. OSX users can download the [Docker Toolbox](https://www.docker.com/toolbox).

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
git submodule update --init
```

Launch:

```bash
./up.sh

```

Mirage application: http://{docker-host-ip}:8001

Twitter Search (demo application): http://{docker-host-ip}:8080

Proxy application: http://{docker-host-ip}:8300/admin  


To update the applications from their upstream repositories:

```bash
git submodule update --init --remote
```

## Usage


> **Note:** After running the up.sh script, you will see the logging output of each application in your terminal window. This will allow you to see what's going on behind the scenes. For a more user-friendly output, you can use [Kitematic](https://kitematic.com/) from Docker which allows you to see the logging output from each individual application in its own window.


In this demo, we will test a simple application called "Twitter Search". This application allows you to submit a search term to the Twitter search API and view the results in JSON format.

You can find more information on the [Mirage testing workflow in the Mirage docs](https://github.com/SpectoLabs/mirage/wiki/Testing-Workflow).

The Twitter Search application has a drop-down (**External API URI**) which allows you to choose whether API calls are routed straight to Twitter or via Mirage.

There is an input field where you can set the name of the Mirage [scenario and session](https://github.com/SpectoLabs/mirage/wiki/Glossary).

Normally these two options would be set in a configuration file, but we've put them in the application UI for the purposes of this demo.  

![demo_twitter_search_initial](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_initial.png)

With the External API URI drop-down set to **Twitter**, you can submit a search query and view the response.

![demo_twitter_search_response](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_response.png)

The Twitter Search application is calling the real Twitter search API which returns a real-time response.

Next you need to configure Mirage to record the Twitter search API responses.

In the Mirage management UI, navigate to **Management > Scenarios** and click the **Add a new scenario** button.

Enter "mirage_app:demo" under **Scenario name** and "test" under **Session name**.

You can find more information on [sessions and scenarios in the Mirage docs](https://github.com/SpectoLabs/mirage/wiki/Glossary).

Check the **Start session in record mode...** box so that when you click the "Submit" button, Mirage is ready to record.

![demo_mirage_add_new_scenario](https://storage.googleapis.com/specto-wiki-img/demo_mirage_add_new_scenario.png)

![demo_mirage_view_session_record](https://storage.googleapis.com/specto-wiki-img/demo_mirage_view_session_record.png)  

Mirage uses proxies to handle the routing of requests and responses. You can find out more about this in the Mirage docs.

In this demo a simple proxy sits between the Twitter Search application and Mirage.

The proxy can be set to either record or playback. By default, it is in record mode. You can see that in record mode the proxy gets responses from the real Twitter API at https://api.twitter.com.

![demo_proxy_record_mode](https://storage.googleapis.com/specto-wiki-img/demo_proxy_record_mode.png)

Return to Twitter Search application and select **Mirage Proxy** in the **External API URI** drop-down. Enter "demo:test" in the **scenario:session** field and submit a search term. The response is still coming from the real Twitter search API, but it is being routed through the proxy.

![demo_twitter_search_proxy](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_proxy.png)

If you go back to the Mirage management UI and navigate to the **Tracker Collection** page, you can see that the Twitter search API response has been recorded.

![demo_mirage_response_recorded](https://storage.googleapis.com/specto-wiki-img/demo_mirage_response_recorded.png)

Now you have recorded a response, you need to switch Mirage into playback mode. In the Mirage application, navigate to **Management > Scenarios** and click the **Stop** button next to the scenario. The recording session stops, and you can click the "play" button to start playback.

![demo_mirage_start_playback](https://storage.googleapis.com/specto-wiki-img/demo_mirage_start_playback.png)

You also need to switch the proxy into playback mode. Go to the Proxy application and click the **Recording** button to switch the proxy into playback mode. You can see that the Proxy is now getting responses from the Mirage Application at http://mirage_app:8001.

![demo_proxy_playback_mode](https://storage.googleapis.com/specto-wiki-img/demo_proxy_playback_mode.png)

Return to the Twitter Search application and submit the search term again. The Twitter Search application is calling Mirage, which is returning the recorded response.

![demo_twitter_search_proxy](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_proxy.png)

Go back to the Mirage application and navigate to the Tracker Collection page. You can see that Mirage is now mimicking the Twitter search API.

![demo_mirage_playback_response](https://storage.googleapis.com/specto-wiki-img/demo_mirage_playback_response.png)

If you click the "Details" button next to one of the responses, you can see more information about the request that Mirage received and the response that it returned.

![demo_mirage_playback_details](https://storage.googleapis.com/specto-wiki-img/demo_mirage_playback_details.png)  

During the recording session, you only entered one search term, so Mirage only recorded one response. If you return to the Twitter Search application and submit a different search term, you can see that Mirage cannot find the correct response for the request.

![demo_twitter_search_no_match](https://storage.googleapis.com/specto-wiki-img/demo_twitter_search_no_match.png)  

However, Mirage can use partial matching - meaning that one request can have multiple possible responses. More on this later.
