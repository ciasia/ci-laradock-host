
# Ci Laradock Host <!-- omit in toc -->

A customised version of Laradock for hosting Ci Projects, using Laradock's badly documented multi-site functionality

&nbsp;




## Table of Contents <!-- omit in toc -->

<!-- toc created automatically via vscode Markdown All in One Plugin https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one -->
<!-- toc -->

- [Getting Set Up](#getting-set-up)
  - [Setting up your Project Folders](#setting-up-your-project-folders)
  - [Testing over HTTPS](#testing-over-https)
- [Helpful Scripts](#helpful-scripts)
  - [`docker-up.sh`](#docker-upsh)
  - [`docker-console.sh`](#docker-consolesh)
  - [`docker-kill.sh`](#docker-killsh)
  - [`docker-cleanup.sh`](#docker-cleanupsh)
  - [`docker-rebuild.sh`](#docker-rebuildsh)
  - [`update-laradock.sh`](#update-laradocksh)

<!-- tocstop -->

&nbsp;





## Getting Set Up


### Setting up your Project Folders

**Warning:**

Laradock/nginx will expose anything in the parent folder of the laradock project to the VM.

For this reason it is recommended to set up a specific "laradock projects" folder for only projects you wish to host over laradock.

Currently in the nginx config, the default site serves out of the `public` folder.

**Recommended Folder Structure:**

```markdown

[~/projects/laradock-projects]
 │
 ├── ci-laradock-host
 │   │
 │   ├── [...lots of laradock folders..]
 │   │
 │   ├── nginx
 │   │   │
 │   │   ├── sites
 │   │   │   │
 │   │   │   ├── default.conf
 │   │   │   ├── ciportal.conf
 │   │   │   ├── some-other-project.conf
 │   │   │   └── index.html
 │   │   │
 │   │   └── index.html
 │   │
 │   │
 │   ├── public
 │   │   │
 │   │   └── index.html
 │   │
 │   ├── docker-up.sh
 │   ├── docker-kill.sh
 │   ├── .env.example
 │   ├── .env.example
 │   └── .env
 │
 ├── ciportal-laravel-api
 │   │
 │   ├── public
 │   │   │
 │   │   ├── css
 │   │   ├── fonts
 │   │   ├── js
 │   │   └── index.php
 │   │
 │   ├── app
 │   ├── config
 │   ├── database
 │   ├── .env.example
 │   └── .env
 │
 └── some-other-project
     │
     ├── public
     │   ├── [...folders]
     │   └── index.php
     ├── app
     ├── config
     └── .env

```

### Testing over HTTPS

To work with integrations you may need to allow insecure access to localhost

If using Chrome, paste this in your URL bar:

`chrome://flags/#allow-insecure-localhost`


You should see highlighted text saying:

Allow invalid certificates for resources loaded from localhost

Click ` Enable `.
  
&nbsp;





## Helpful Scripts

### `docker-up.sh`

Run up the docker server.

&nbsp;


  
  
### `docker-console.sh`

Connect to the docker server in bash

This will open the public root as the current working directory, so to access laravel artisan
you will need to open the appropriate folder, i.e. `cd ciportal-laravel-api`.

&nbsp;


  
  
### `docker-kill.sh`

Suspends the servers. Doesn't remove the VMs, just puts them to sleep.  
Use `docker-compose down` to remove them entirely.

&nbsp;


  
  
### `docker-cleanup.sh`

Provides options for pruning all stored Docker VM images, or just those not currently in use
by a VM.

&nbsp;


  
  
### `docker-rebuild.sh`

Kills the containers and then builds them again.

&nbsp;

  
  
### `update-laradock.sh`

Updates Laradock from the main Laradock repo on Github.

You will need to set an upstream git endpoint for this to work, make sure this is in your git config.

<details><summary>Configuring Upstream</summary>

&nbsp;

**Command:**

```bash
git remote add upstream git@github.com:laradock/laradock.git
```

**Config:**


```gitconfig
[remote "upstream"]
  url = git@github.com:laradock/laradock.git
  fetch = refs/heads/master
```

</details>

&nbsp;

  
  