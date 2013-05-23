## Description

This is a [Chef](http://www.opscode.com/chef/) recipe for installing
the [Elefant CMS](http://www.elefantcms.com/) and associated LAMP stack
(Apache2, MySQL, SQLite, and PHP).

## Requirements

### Platform

* Debian, Ubuntu

Tested on:

* Ubuntu 12.04

### Cookbooks

* mysql
* php
* apache2
* openssl

## Attributes

* `node['elefant']['version']` - Set the version to download. Using 'latest' (the default) will install from the latest master on Github. Use underscores instead of spaces in the version name (e.g., '1_3_6_beta')
* `node['elefant']['document_root']` - Set the location to place the Elefant files. Default is `/var/www/elefant`.
* `node['elefant']['server_aliases']` - Array of ServerAliases to add to the Apache vhost. Default is `*`.

## Usage

Add the "elefant" recipe to your node's run list or role, or include the recipe in another cookbook.
To add this recipe, clone this repository into your cookbooks folder and name the folder 'elefant'.

Chef will also install and configure the mysql, php, and apache2 recipes in addition to Elefant.

To complete the installation, visit `http://hostname/install/` (change the hostname if you change the attribute values).

## License

The MIT License

Copyright (c) 2013 Johnny Broadway

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
