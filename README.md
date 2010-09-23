# Profig
Config is such a negative term, particularly since figs are so delicious.
Who could be against figs?  Profig takes a more positive stance and
whole-heartedly supports figs.


# Sample
Profig expects system configuration in YAML, and it looks like this:
<pre>
profig:
  - group:
      - ur_app_group
  - user:
      - ur_app_user
  - dir:
      - /var/lib/ur_app
            owner: ur_app_user:ur_app_group
            mode: 0755
  - deb:
      - ruby
      - rubygems
      - erlang
</pre>

Profig will read that config file and do a few things (if necessary):

* Create a system group called ur_app_group
* Create a system user called ur_app_user
* Create the /var/lib/ur_app directory and set it to be owned by the ur_app_user and ur_app_group with 0755 permissions
* Install the ruby, rubygems & erlang debian packages

Each of these items will be handled in the order they appear in the file.
If an item is already in the correct state, nothing will be done.


# Deployment
Unlike some other system configuration tools, Profig does not have a central
server and does not handle pushing configuration to each machine.  It expects
configuration files to be deployed to each machine along with whatever code is
being deployed to those systems.

By default, Profig looks for configuration files in /var/lib/profig/conf.d/
and will run against all the files there.


# Features & Limitations
Can:

* Create users & groups
* Create directories & manage their permissions
* Deploy files & manage their permissions
* Install & update debian packages

Cant:

* Everything else


# Links

* [Source Code](http://github.com/mdg/profig)
* [Gem](https://rubygems.org/gems/profig)
