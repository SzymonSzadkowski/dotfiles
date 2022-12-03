local schemas = {
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "Babel configuration",
		fileMatch = {
			".babelrc.json",
			".babelrc",
			"babel.config.json",
		},
		url = "https://json.schemastore.org/babelrc.json",
	},
	{
		description = "ESLint config",
		fileMatch = {
			".eslintrc.json",
			".eslintrc",
		},
		url = "https://json.schemastore.org/eslintrc.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "Vercel Now config",
		fileMatch = { "now.json" },
		url = "https://json.schemastore.org/now",
	},
	{
		description = "Stylelint config",
		fileMatch = {
			".stylelintrc",
			".stylelintrc.json",
			"stylelint.config.json",
		},
		url = "https://json.schemastore.org/stylelintrc",
	},
	{
		description = "Config file for Command Task Runner",
		fileMatch = {
			"commands.json",
		},
		url = "https://json.schemastore.org/commands.json",
	},
	{
		description = "Json schema for properties json file for a GitHub Workflow template",
		fileMatch = {
			".github/workflow-templates/**.properties.json",
		},
		url = "https://json.schemastore.org/github-workflow-template-properties.json",
	},
	{
		description = "Packer template JSON configuration",
		fileMatch = {
			"packer.json",
		},
		url = "https://json.schemastore.org/packer.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "https://json.schemastore.org/package.json",
	},
	{
		description = "JSON schema for Visual Studio component configuration files",
		fileMatch = {
			"*.vsconfig",
		},
		url = "https://json.schemastore.org/vsconfig.json",
	},
}

local opts = {
	json = {
		schemas = schemas,
	},
}

return opts
