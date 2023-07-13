# CHILI Apache Reverse Proxy Load Latest
This is an example project to be able to see how a reverse proxy is setup for CHILI Publisher

No support will be given for this example.

# Setup

## Requirements
Before going to the setup steps, you need to:
- Download the project
- Install Docker and Docker Compose

### Download Project
Download this project using `git clone https://github.com/seancrowe/chili-apache-reverse-proxy.git` or downloading the code as a zip form github.

### Install Docker and Docker Compose
Install Docker and Docker Compose using your favorite package manager or from the docker website:

- Docker: https://docs.docker.com
- Docker Compose: https://docs.docker.com/compose/

Once both are installed, and your docker service is running, you are ready to move on to the setup steps.

## Setup Steps
All steps below assume you are in the project directory.

### Step 1
Open the example.conf file in your favorite editor and update the line 17 and 18 for your CHILI Publish Online/GraFx environment
```
ProxyPass /editor/ https://ft-nostress.chili-publish.online/
ProxyPassReverse /editor/ https://ft-nostress.chili-publish.online/
```

Important note, if you have more than one environment in the same region, then there is a very high chance you can use the same environment URL for all your environments.

So imagine if you have three environment URLs:
- `https://environment-1.chili-publish.online/`
- `https://environment-2.chili-publish.online/`
- `https://environment-3.chili-publish.online/`

There is a very high chance you can just setup a reverse proxy for any one of those, and it will work for all of them.

Example this setup, should work for environment-1 and environment-2:
```
ProxyPass /editor/ https://environment-3.chili-publish.online/
ProxyPassReverse /editor/ https://environment-3.chili-publish.online/
```

Obviously, this is not true for production vs sandbox. For production and sandbox or different regions, you will need to setup different reserve proxies.

### Step 2
Run Docker Compose `up` with the `--build` option, which on Linux will most likely be the command:

```bash
sudo docker-compose up --build
```

### Step 3
If step 2 was successful, your website will be running on the IP address of the machine that is running Docker. In most cases, you can use localhost `127.0.0.1`

In a browser make sure to type in the IP with protocol HTTPS on port 8080.

Example: `https://127.0.0.1:8080`

### Optional - Change Port
If you don't want to use port 8080, but want to use port 433, then open docker-compose.yaml and change this:

```yaml
 ports:
      - "8080:443"
```

to this:

```yaml
 ports:
      - "433:443"
```

For most browsers, you will get a page a warning about "Your connection is not private", but just click `Advance` and the `Proceed` link.

A page will show with the header "This is a reverse proxy".

### Step 4
In your integration make sure to open your editor using the reverse proxy URL:

```
`https://127.0.0.1:8080/editor/{environment}/editor_html.aspx
```

Now the Editor will load with the latest Publisher Interface.