project('ambition-plugin-almanna', ['vala', 'c'], version: '0.2')

app_name = 'ambition-plugin-almanna'

pkg = import('pkgconfig')
vala = meson.get_compiler('vala')

message('Found Vala ' + vala.version())
if vala.version().version_compare('<0.48')
  error('Requires Vala >= 0.48')
endif

default_dependencies = [
  dependency('glib-2.0', version: '>=2.32'),
  dependency('gmodule-2.0'),
  dependency('gobject-2.0'),

  dependency('gee-0.8'),
  dependency('gio-2.0'),
  dependency('json-glib-1.0'),
  dependency('libsoup-2.4'),
  dependency('log4vala-0.2'),
  dependency('ambition-0.2'),
	dependency('almanna-0.1'),

  vala.find_library('posix')
]
default_vala_options = [
  '--enable-experimental',
  '--target-glib=2.32'
]

subdir('src')
subdir('test')

install_data(
  'manifest.json',
  'README.md',
  install_dir: get_option('prefix')
)
