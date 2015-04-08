# spinen-autolog-cookbook

This cookbook installs and configures the [autolog](http://manpages.ubuntu.com/manpages/trusty/man8/autolog.8.html) utility.

The autolog utility is managed by the `/etc/autolog.conf` configuration file. Configuration options [are documented here](http://manpages.ubuntu.com/manpages/natty/man5/autolog.conf.5.html)



## Supported Platforms

Ubuntu 14.04

## Attributes

This cookbook only includes 2 attributes:

`node['autolog']['nolostkill']` is by default `true`. This atrribute writes the line `nolostkill` at the end of the configuration file. Setting this attribute to false will eliminate that line.

`node['autolog']['protected_users']` is an array of users you wish to exempt from being logged out. By default this includes only `root`. The vagrant recipe adds the `vagrant` user for vagrant VMs and is a simple example of how to add users to this array.


## Usage::Recipes



### spinen-autolog::default

Include `spinen-autolog` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[spinen-autolog::default]"
  ]
}

### spinen-autolog::vagrant
```
Include `spinen-autolog::vagrant` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[spinen-autolog::vagrant]"
  ]
}
```

This recipe will add the `vagrant` user as a protected user that does not get logged off when idle.

## Usage::the `autolog_line` resource

The `autolog_line` resource enables a user to write any configuration line to the `/etc/autolog.conf` file. Lines will appear in the configuration file **_in the order they appear in the recipe._**

The `autolog_line` default and only **action** is `:create`

The `autolog_line` resource takes two hash **attributes**: 

The `switches` attribute is a hash of the available switches it is possible to set as documented in the [autolog manpage](http://manpages.ubuntu.com/manpages/natty/man5/autolog.conf.5.html). By default **_none_** of these switches are set.

The `boolean_attributes` attribute hash is a set of true/false attributes available to write in a configuration line. The author has tried to set sane defaults for these.

Example, from the `default` recipe:

```
everyone_switches = { idle: '10', grace: '60' }

autolog_line 'everyone' do
  switches everyone_switches
  action :create
end
```

Results in this line in the `autolog.conf` configuration file:

```
idle=10 grace=60 nohard nomail clear warn log
```



## License and Authors

Author:: SPINEN (<luke.reimer@spinen.com>)
