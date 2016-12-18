#Class parameters for wkhtmltox
class wkhtmltox::params {

  #Default parameters
  $majversion = '0.12'
  $version    = '0.12.2.1'
  $arch       = $::architecture
  #default rhel 7  
  $os_major_ver = '7'
  
  #A bit hacky but the packaged versions of wkhtmltox are sparse
  case $::osfamily {
    'Debian': {
      $osver         = $::lsbdistcodename
      $packagetype   = 'deb'
      $provider      = 'dpkg'
      $required_pkgs = [
        'libqt4-network',
        'fontconfig',
        'libjpeg8',
        'libxrender1',
        'libxext6',
        'xfonts-base',
        'xfonts-75dpi'
      ]
    }
    'RedHat': {
      $osver         = "centos${os_major_ver}"
      $packagetype   = 'rpm'
      $provider      = 'rpm'
      $required_pkgs = [
        'libjpeg-turbo',
        'fontconfig',
        'qt',
        'libXrender',
        'xorg-x11-fonts-75dpi'
      ]
    }
    default: {
      fail("Class['wkhtmltox::params']: Unsupported OS: ${::osfamily}")
    }
  }

}
