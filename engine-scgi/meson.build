project('ambition-engine-scgi', ['vala', 'c'], version: '0.2')

app_name = 'ambition-engine-scgi'

pkg = import('pkgconfig')
vala = meson.get_compiler('vala')

message('Found Vala ' + vala.version())
if vala.version().version_compare('<0.54')
  error('Requires Vala >= 0.54')
endif

gscgi_dep = dependency('libgscgi-1.0', required: false)
if not gscgi_dep.found()
  gscgi_proj = subproject('libgscgi')
  gscgi_dep = gscgi_proj.get_variable('dep')
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
	gscgi_dep,

  vala.find_library('posix')
]
default_vala_options = [
  '--enable-experimental',
  '--target-glib=2.32'
]

subdir('src')

install_data(
  'manifest.json',
  'README.md',
  install_dir: get_option('prefix')
)
