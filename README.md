#chef-keys [![Build Status](https://secure.travis-ci.org/cdracars/chef-keys.png?branch=master)](http://travis-ci.org/cdracars/chef-keys)
-------------------
Creates keys in `/home/chef/.ssh/` from a data bag.


## Assumptions

`/home/chef` belongs to user `chef` which belongs to group `chef`.


## Attributes

* `keys/databag`: string containing name of data bag containing the keys
* `keys/key_name`: name of the keypair to be copied


## Recipes

* `keys`: copies keys into `/home/chef/.ssh/`


## Data bag structure example

    "ssh_keys": {
      "machine_1": {
        "id_rsa": "private key goes here",
        "id_rsa.pub": "public key goes here"
      }
    }


## Legal

* Written by [Carlo Zottmann](http://github.com/carlo/)
* Liability in case of anything: definitely not me.
* License: [WTFPL](http://en.wikipedia.org/wiki/WTFPL).
