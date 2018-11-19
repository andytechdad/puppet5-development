class profile::base (){

  file {'/etc/motd':
    content => epp('profile/motd'),
  }
}
