This guide provides detailed instructions on how to install and configure the **GitHub MCP Server** (GitHub's Model Context Protocol Server) across various Claude applications, including Claude Code CLI, Claude Desktop, and Xcode (Claude Agent).

### 1. Claude Code CLI

* **Prerequisites:**
  - Claude Code CLI: [guide](https://docs.anthropic.com/en/docs/claude-code/overview)
  - GitHub PAT: [create one](https://github.com/settings/tokens)
  - Docker: [install here](https://www.docker.com/get-started/)
  - It is recommended to open Claude Code within your project directory.

* **Remote Server Setup (HTTP):** 
    1. Run the following command in the terminal (not in Claude Code CLI):
        # For Window
        `$pat="YOUR_PAT"
            claude mcp add github --transport http https://api.githubcopilot.com/mcp `
            -H "Authorization: Bearer $pat"`
        # For MacOs/Linux:
            `export GITHUB_PAT=ghp_xxxxxxxxx
            claude mcp add-json github \
            '{"type":"http","url":"https://api.githubcopilot.com/mcp","headers":{"Authorization":"Bearer '"$GITHUB_PAT"'"}}'`
    2. Restart Claude Code
    3. Check MCP List: `claude mcp list`
    * Uninstall: `claude mcp remove github`

* **Local Server Setup (Docker or Binary):**
* *With Docker:* 
    1. Pull Image
        `docker pull ghcr.io/github/github-mcp-server`
    2. Run the following command in the terminal (not in Claude Code CLI):
        PowerShell:
            `$env:GITHUB_PERSONAL_ACCESS_TOKEN="YOUR_GITHUB_PAT"`
            `claude mcp add github -e GITHUB_PERSONAL_ACCESS_TOKEN=$env:GITHUB_PERSONAL_ACCESS_TOKEN -- docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server`
        Bash:
            `export GITHUB_PERSONAL_ACCESS_TOKEN="YOUR_GITHUB_PAT"`
            `claude mcp add github -e GITHUB_PERSONAL_ACCESS_TOKEN -- docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server`
    3. Check MCP List: `claude mcp list`
    * Uninstall: `claude mcp remove github`
    
* *With a Binary:* [download here](https://github.com/github/github-mcp-server/releases)
    1. Download release binary
    2. Add to your `PATH`
    3. Run the following command in terminal:
        PowerShell:
            `$env:GITHUB_PERSONAL_ACCESS_TOKEN="YOUR_GITHUB_PAT"`
            `claude mcp add github github-mcp-server stdio --env GITHUB_PERSONAL_ACCESS_TOKEN=$env:GITHUB_PERSONAL_ACCESS_TOKEN`
        Bash:
            `claude mcp add-json github '{"command": "github-mcp-server", "args": ["stdio"], "env": {"GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PAT"}}'`


### 2. Claude Desktop:
-- GitHub MCP Server - Local Dev
* Configuration File Location (`claude_desktop_config.json`):
** Located in specific directories depending on the OS (macOS, Windows, or Linux).

* *Without Docker*: `Note: Add Folder Bibrary to your PATH `
    `{
        "mcpServers": {
            "github": {
            "command": "github-mcp-server",
            "args": ["stdio"],
            "env": {
                "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PAT"
            }
            }
        }
    }
    `
* *With Docker*: `Note: Pull image - docker pull ghcr.io/github/github-mcp-server`
    `
    {
        "mcpServers": {
            "github": {
            "command": "docker",
            "args": [
                "run",
                "-i",
                "--rm",
                "-e",
                "GITHUB_PERSONAL_ACCESS_TOKEN",
                "ghcr.io/github/github-mcp-server"
            ],
            "env": {
                "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PAT"
            }
            }
        }
    }
    `
   
* Restart Claude Desktop

* GitHub Integration (Connector) - OAuth App
    1. Connect GitHub (OAuth)
        `Claude → Settings → Connectors → Github Integration → Connect`
    2. GitHub OAuth Authorization
        Authorize "Claude by Anthropic"
    3. Install Claude GitHub App
        `GitHub → Settings → Applications → Installed GitHub Apps`
        Install Claude on your GitHub account
        select `All repositories` or `Only selected repositories`
    4. Restart Claude Desktop

    * Notice: https://github.com/anthropics/claude-code/issues/32479


### 3. Troubleshooting & Important Notes

* **Authentication Failure:** Verify that the PAT has the necessary `repo` scopes and has not expired.
* **Docker Issues:** Ensure Docker Desktop is running. Try pulling the image again (`docker pull`) or logging out of the registry (`docker logout ghcr.io`) before retrying.
* **Server/Tools Not Showing:** Run `claude mcp list` to check active configurations, validate JSON syntax, ensure environmental variables are properly sourced, and check application logs.
* **Deprecation Notice:** The legacy npm package `@modelcontextprotocol/server-github` has been **deprecated as of April 2025**.