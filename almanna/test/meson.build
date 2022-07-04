test_name = meson.project_name() + '-test'

test_sources = files([
	'AlmannaTest.vala',
	'UserEntity.vala'
])

test_deps = [
	deps,
	declare_dependency(
		link_with: app_lib,
		include_directories: include_directories('../src')
	)
]

tests = executable(
	test_name,
	sources: test_sources,
	dependencies: test_deps,
	install: false
)

test('tests', tests,
  env: [
    'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
    'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
  ],
  workdir: meson.current_source_dir(),
  protocol: 'tap'
)
