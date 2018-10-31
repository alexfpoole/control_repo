class mine {
  file {'/opt/mine':
    ensure => directory,
  }
  file {'/opt/mine/mineserver.jar':
    ensure => file
    source => 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/mine/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/mine/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
    
