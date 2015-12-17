# php-scratchboard

## Project Summary
A simple PHP project aimed to help people learn PHP and general programming concepts.

### Why?
I started working on this for fun in my free time to help friends of mine get a better understanding of programming in general, using PHP. My goal is to keep slowly building up the base project to have support for more things (such as Memcache, MySQL, or Composer) so that more advanced concepts can be covered.

### How?
After starting up your local app VM (as discussed below), visiting the local environment website will run any code placed into the `scratchboard.php` file. The concept is to use this file and any code added to the `root/app` folder to work through the exercises created in the `exercises` folder.

While some of the exercises are more thought problems than they are coding problems, the intention is to have a variety of different activities that cover a lot of different aspects of programming vs. just straight problem solving.


## Requirements
In order to use this project, you will need to install vagrant and virtualbox.

| Software | Download Link |
| --------: | :----------- |
| Vagrant | https://www.vagrantup.com/ |
| VirtualBox | https://www.virtualbox.org/ |

## Local Environment
Open `cmd` and `cd` to `ProjectDir/vagrant` then type `vagrant up --provision`.

Assuming nothing goes wrong, you will then be able to open your web browser and navigate to
`http://10.10.2.20`.

You can write code into the `ProjectDir/root/scratchboard.php` for working.

You can create objects, models, services, controllers, and whatever else in the `ProjectDir/app/` folder.  The autoloader will load files from there.

## Troubleshooting
- Ensure the VT-x/AMD-x support is enabled in your BIOS
 - This is to ensure that Virtualbox can run the Vagrant VM.

## TODO
### Need to have
- Suggested learning exercises and projects

### Should have
- Proper apache redirects

### Nice to have
- Database support
- Composer support
