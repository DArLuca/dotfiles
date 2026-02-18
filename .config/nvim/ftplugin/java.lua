local home = os.getenv('HOME')

-- Check if jdtls is available
local ok, jdtls = pcall(require, 'jdtls')
if not ok then
  vim.notify("nvim-jdtls not installed", vim.log.levels.WARN)
  return
end

-- Project name and workspace setup
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

-- Capabilities for Autocompletion
local cmp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = cmp_ok and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

-- Find jdtls installation (Mason installs it here)
local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'

-- Determine OS-specific configuration path
local system = vim.loop.os_uname().sysname
local config_path
if system:match("Linux") then
  config_path = jdtls_path .. '/config_linux'
elseif system:match("Darwin") then
  config_path = jdtls_path .. '/config_mac'
else
  config_path = jdtls_path .. '/config_win'
end

-- Find the launcher jar
local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', launcher_jar,
    '-configuration', config_path,
    '-data', workspace_dir,
  },
  root_dir = jdtls.setup.find_root({'.git', 'pom.xml', 'build.gradle'}),
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      saveActions = { organizeImports = true },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
  },
}

-- Start Java LSP
jdtls.start_or_attach(config)
