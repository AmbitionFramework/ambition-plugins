sources = [
	'SCGI.vala',
	'SCGIPlugin.vala',
	'SCGIUtility.vala',
]

deps = [
  default_dependencies
]

app_lib = shared_library(
  app_name + '-' + meson.project_version(),
  sources: sources,
  dependencies: default_dependencies,
  vala_args: default_vala_options,
  install: true
)

install_data(
  app_name + '-' + meson.project_version() + '.deps',
  install_dir: join_paths(get_option('datadir'), 'vala', 'vapi')
)
