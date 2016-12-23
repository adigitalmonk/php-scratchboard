# php-scratchboard

## Project Summary
A simple PHP project aimed to provide a user with a very basic PHP 7.0 environment.  This way, they can easily experiment with different ideas without having to go through the work to spin up their own development environment. An alternate benefit to this, is that you can easily fork this project and have a basis for your own PHP 7.0 projects.

Feel free to reach out with suggestions or improvements.

### Why?
I started working on this for fun in my free time to help friends of mine get a better understanding of programming in general using PHP. My goal is to keep slowly building up the base project to have support for more things (such as Memcache, MySQL) so that more advanced concepts can be experimented with.

### How?
After starting up your local app VM (as discussed below), visiting the local environment website will run any code placed into the `scratchboard.php` file. The concept is to use this file and any code added to the `root/app` folder to work through the exercises created in the `exercises` folder.

While some of the exercises are more thought problems than they are coding problems, the intention is to have a variety of different activities that cover a lot of different aspects of programming vs. just straight problem solving.


## Requirements
In order to use this project, you will need to install `Vagrant` and `VirtualBox`.

| Software | Download Link |
| --------: | :----------- |
| Vagrant | https://www.vagrantup.com/ |
| VirtualBox | https://www.virtualbox.org/ |

## Local Environment
- Open `cmd` (Windows), Terminal (OS X) or whatever your terminal of choice is.
- `cd` to `{proj_dir}/vagrant`
- Execute `vagrant up` (the `Vagrantfile` is configured to always provision)
 - If you want to be explicit with your provisioning, you can use `vagrant up --provision`
- The provisioner will set up `nginx`, `php7.0`, run the `composer install` process for you.

Assuming nothing goes wrong, you will then be able to open your web browser and navigate to `http://10.10.2.20`.
- `nginx` is configured so that all requests should go to the `index.php`
- `index.php` only exists to load the configuration and run what's in `scratchboard.php`
- Write code into the `{proj_dir}/root/scratchboard.php` for working/experimenting.


You can create objects, models, services, controllers, and whatever else in the `{proj_dir}/app/` folder. This is the folder that the autoloader points to.

This project leverages `composer` for it's autoloading, but the real benefit is your ability to include any libraries you want to include.

## Troubleshooting
- Ensure the VT-x/AMD-x support is enabled in your BIOS
 - This is to ensure that Virtualbox can run the Vagrant VM.
- If you are on Windows using Git Bash or Cygwin:
 - Create `~/.bashrc` if it doesn't exist
 - Add `export VAGRANT_DETECTED_OS=cygwin` on it's own line

## TODO
- Set up `phing` for tasks
- UnitTest framework using phpunit
- Memcache
- SSL
- Database support
