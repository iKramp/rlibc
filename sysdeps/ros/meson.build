sysdep_supported_options = {
	'posix': false,
	'linux': false,
	'glibc': false,
	'bsd': false,
}

rtld_sources += files(
	'generic/generic.cpp'
)

libc_sources += files(
	'generic/entry.cpp',
	'generic/generic.cpp',
	'generic/thread.cpp',
	'generic/thread_entry.S'
)

if not no_headers
	install_headers(
		follow_symlinks: true
	)
endif
