# php-scratchboard

## Project Summary
A simple PHP project aimed to help people learn PHP and PHP concepts.

## Requirements
In order to use this project, you will need to install vagrant and virtualbox.

| Software | Download Link |
| --------: | :----------- |
| Vagrant | https://www.vagrantup.com/ |
| VirtualBox | https://www.virtualbox.org/ |

## How
Open `cmd` and `cd` to `ProjectDir/vagrant` then type `vagrant up --provision`.

Assuming nothing goes wrong, you will then be able to open your web browser and navigate to
`http://10.10.2.20`.

You can write code into the `ProjectDir/root/scratchboard.php` for working.

You can create objects, models, services, controllers, and whatever else in the `ProjectDir/app/` folder.  The autoloader will load files from there.

## Troubleshooting
- Ensure the VT-x/AMD-x support is enabled in your BIOS

## TODO
### Need to have
- Suggested learning exercises and projects

### Should have
- Proper apache redirects

### Nice to have
- Database support
- Composer support
