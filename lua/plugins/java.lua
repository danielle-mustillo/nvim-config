-- Copied from https://github.com/LazyVim/LazyVim/discussions/2992
-- merged into this was this: https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L1-L149
--
-- The vscode use of these options might be a useful reference (see java.completion stuff)  https://github.com/redhat-developer/vscode-java/blob/main/package.json
return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = function(opts)
      --local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
      --local jvmArg = "-javaagent:" .. install_path .. "/lombok.jar"
      --table.insert(opts.cmd, "--jvm-arg=" .. jvmArg)

      opts.settings = {
        java = {
          eclipse = {
            downloadSources = true,
          },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              --"java.util.Objects.requireNonNull",
              --"java.util.Objects.requireNonNullElse",
              --"org.junit.Assert.*",
              --"org.junit.Assume.*",
              "org.junit.jupiter.api.Assertions.*",
              "org.junit.jupiter.api.Assumptions.*",
              "org.junit.jupiter.api.DynamicContainer.*",
              "org.junit.jupiter.api.DynamicTest.*",
              "org.mockito.Mockito.*",
              "org.mockito.ArgumentMatchers.*",
              "org.mockito.Answers.*",
            },
            filteredTypes = {
              "com.sun.*",
              "io.micrometer.shaded.*",
              "java.awt.*",
              "jdk.*",
              "sun.*",
            },
            -- chatgpt found this for the static imports section (and all other imports)
            -- https://github.com/redhat-developer/vscode-java/pull/2685/files
            importOrder = {
              "",
              --"com",
              --"lombok",
              --"org",
              "java",
              "javax",
              "#",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-17",
                path = "/usr/lib/java/java-17-openjdk-amd64",
              },
              {
                name = "JavaSE-21",
                path = "/usr/lib/java/java-21-openjdk-amd64",
              },
            },
          },
          format = {
            enabled = true,
            settings = {
              --url = vim.fn.expand("~/Workspace/eclipse-java-google-style.xml"),
              url = "file://" .. vim.fn.stdpath("config") .. "/formatters/java.xml",
              profile = "MyProfile",
            },
          },
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
          maven = {
            downloadSources = true,
          },
          references = {
            includeDecompiledSources = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
        },
      }

      return opts
    end,
  },
}
