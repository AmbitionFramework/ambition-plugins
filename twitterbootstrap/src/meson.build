sources = [
	'TwitterBootstrapPlugin.vala',
	'Form/TBButton.vala',
	'Form/TBCheckboxGroupInput.vala',
	'Form/TBGroupInput.vala',
	'Form/TBPasswordInput.vala',
	'Form/TBRadioGroupInput.vala',
	'Form/TBResetButton.vala',
	'Form/TBSelectGroupInput.vala',
	'Form/TBSubmitButton.vala',
	'Form/TBTextarea.vala',
	'Form/TBTextInput.vala',
]

deps = [
  default_dependencies
]

app_lib = shared_library(
  app_name + '-' + meson.project_version(),
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
