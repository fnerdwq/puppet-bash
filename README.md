#puppet-bash

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What Bash affects](#what-bash-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Bash](#beginning-with-Bash)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#TODOs)

##Overview

This small bash module installs and configures bash.

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What Bash affects

* bash :-) 

###Setup Requirements

Nothing special.
	
###Beginning with Bash	

Simply include it.

##Usage

Just include the module by 

```puppet
include bash
```

##Limitations:

Debian like systems. 
Tested on:

* Debian 7
* CentOs 6

Puppet Version >= 3.4.0, due to specific hiera usage.

##TODOs:

* make it work with puppet pre 3.4 
