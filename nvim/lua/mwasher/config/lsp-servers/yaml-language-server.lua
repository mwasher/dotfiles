return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yml", "yaml", "yaml.docker-compose", "yaml.gitlab" },
	root_markers = { ".git" },
	settings = {
		redhat = { telemetry = { enabled = false } },
	},
}
