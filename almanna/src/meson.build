sources = [
	'AlmannaPlugin.vala',
	'AlmannaSession.vala',
	'AlmannaUtility.vala',
	'AuthorizerAlmanna.vala',
	'StorableAlmanna.vala',
	'UserAlmanna.vala'
]

deps = [
  default_dependencies
]

full_app_name = app_name + '-' + meson.project_version()

app_lib = shared_library(
  full_app_name,
  sources: sources,
  dependencies: default_dependencies,
  vala_args: default_vala_options,
  install: true,
  install_dir: [true, true, true]
)

install_data(
  app_name + '-' + meson.project_version() + '.deps',
  install_dir: join_paths(get_option('datadir'), 'vala', 'vapi')
)
