This guide provides instructions for configuring the Prisma MCP server locally with Claude Code CLI and Claude Desktop.

### 1. Claude Code CLI

* **Prerequisites:**
  - Claude Code CLI: [guide](https://docs.anthropic.com/en/docs/claude-code/overview)
  - Node.js and npm
  - Prisma CLI available through `npx`
  - It is recommended to open Claude Code within your project directory.

* **Local Server Setup:**
    1. Run the following command in the terminal (not inside Claude Code CLI):
        `claude mcp add --transport http prisma https://mcp.prisma.io/mcp`
    2. Restart Claude Code
    3. Check MCP List: `claude mcp list`
    * ! Needs authentication
    * Uninstall: `claude mcp remove prisma`

### 2. Claude Desktop

* Prisma MCP Server - Local Dev
* Configuration File Location (`claude_desktop_config.json`)
  - Claude → Settings → Developer → Edit Config
  - The file location depends on your OS (macOS, Windows, or Linux).

* Add the following configuration:
    ```json
    {
      "mcpServers": {
        "prisma-local": {
          "command": "npx",
          "args": [
            "-y",
            "prisma",
            "mcp"
          ]
        }
      }
    }
    ```

* Restart Claude Desktop
* ! Needs authentication

### 3. Troubleshooting & Important Notes

* **Server Not Showing Up:** Run `claude mcp list` to verify the MCP entry is registered.
* **Node.js Issues:** Make sure `node` and `npx` are installed and available in your terminal.
* **Configuration Errors:** Validate the JSON syntax in `claude_desktop_config.json` before restarting Claude Desktop.
