# Nvim Setup

This repo contains all the plugins and configs that you may use to run your projects.
It also provides some useful scripts and recommendations in order to make everything run.

---

## Installed Tools

| Tool | Tool | Tool |
|---|---|---|
| cmake-language-server | codelldb | cpplint |
| docker-compose-language-service | dockerfile-language-server | hadolint |
| java-debug-adapter | java-test | jdtls |
| json-lsp | lua-language-server | markdown-toc |
| markdownlint-cli2 | marksman | netcoredbg |
| omnisharp | php-cs-fixer | php-debug-adapter |
| phpactor | phpcs | pint |
| pretty-php | pyright | ruff |
| shfmt | sqlfluff | stylua |
| taplo | tree-sitter-cli | |

---

## Go Setup

The Go setup is enabled through the LazyVim extra:

```json
"lazyvim.plugins.extras.lang.go"
```

After cloning this repo and running `:Lazy sync`, LazyVim should load the Go plugin
specs. After opening Neovim, check `:Mason` to confirm the external Go tools were
installed.

### LazyVim Go plugins/config

These are provided by the Go extra itself:

| Item | Purpose |
|---|---|
| `nvim-treesitter` parsers: `go`, `gomod`, `gowork`, `gosum` | Syntax parsing and highlighting |
| `nvim-lspconfig` with `gopls` | Go language server configuration |
| `nvim-dap-go` | Go integration for Neovim DAP/debugging |
| `neotest-golang` | Go test integration |
| `mini.icons` Go icons | Filetype/icon metadata |

### Mason Go tools

These are external tools that Mason should install for Go support:

| Tool | Purpose |
|---|---|
| `gopls` | Go language server |
| `goimports` | Import-aware formatter |
| `gofumpt` | Stricter Go formatter |
| `gomodifytags` | Struct tag editing helper |
| `impl` | Interface implementation helper |
| `golangci-lint` | Go lint runner |
| `delve` / `dlv` | Go debugger used by DAP |

If something is missing after a fresh clone, open `:Mason` and install the missing
tool from the table above.

---

## C++ Setup

### 1. Installation

Give permission to the setup script and run it:

```bash
chmod +x setup_cpp.sh
./setup_cpp.sh
```

Then install the compiler, debugger, formatter, and static analyzer:

```bash
sudo apt update
sudo apt install -y build-essential g++ clang clangd clang-format clang-tidy lldb
```

---

### 2. Debugger (Manual)

This section covers manual debugging for small files. For larger projects, see [C++ Project Pattern](#3-c-project-pattern) below.

**Compile with debug symbols:**

```bash
g++ -g <file.cpp> -o <fileName>
./<fileName> <args>
```

**Debugger workflow:**

1. Set breakpoints with `<leader>db`
2. Compile with `-g`
3. Start DAP
4. Select the executable
5. Pass runtime args if needed

**Example:**

```bash
g++ -g main.cpp -o main
```

- When asked for the executable: `<directory>/main`
- When asked for args: `42 hello`

---

### 3. C++ Project Pattern

#### CMake

> TO-DO

#### Format with clangd

Create a `.clang-format` file at the project root:

```yaml
---
Language: Cpp
BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never
ColumnLimit: 100
BreakBeforeBraces: Allman
AllowShortFunctionsOnASingleLine: None
AllowShortIfStatementsOnASingleLine: Never
AllowShortLoopsOnASingleLine: false
AllowShortBlocksOnASingleLine: Never
Cpp11BracedListStyle: false
SpaceBeforeCpp11BracedList: true
PointerAlignment: Left
ReferenceAlignment: Left
NamespaceIndentation: All
AccessModifierOffset: -4
...
```

Create a `.clang-tidy` file at the project root:

```yaml
Checks: >
  clang-analyzer-*,
  bugprone-*,
  performance-*,
  readability-*,
  modernize-*,
  cppcoreguidelines-*
WarningsAsErrors: ''
HeaderFilterRegex: '.*'
CheckOptions:
  - key: readability-braces-around-statements.ShortStatementLines
    value: '1'
  - key: modernize-use-nullptr.NullMacros
    value: 'NULL'
```

**Apply formatting:**

```bash
# Preview changes
clang-format --style=file <file.cpp>

# Apply changes in-place
clang-format --style=file -i <file.cpp>
```
