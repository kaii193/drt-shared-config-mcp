This guide provides instructions for configuring the **Whimsical MCP server** using remote MCP settings and verified connectors.

### 1. Remote MCP Setup

* Whimsical’s hosted MCP server endpoint:
  `https://mcp.whimsical.com/mcp`
* Whimsical uses OAuth authentication, so you do not need a PAT or manual API token.
* This is the recommended setup for most users.

### 2. Claude Code CLI

* **Option A — Add a custom remote MCP server:**
    1. Open a terminal outside Claude Code CLI.
    2. Run:
        `claude mcp add --transport http whimsical-remote https://mcp.whimsical.com/mcp`
    3. Restart Claude Code.
    4. Verify the server is registered:
        `claude mcp list`
    5. Remove it when needed:
        `claude mcp remove whimsical-remote`

* **Option B — Use the verified Whimsical connector:**
    1. Open Claude and go to the Connector Directory.
    2. Search for `Whimsical` or visit:
        `https://claude.ai/directory/connectors/whimsical`
    3. Click `Connect` and complete the Whimsical authentication.
    4. After connecting, Claude can access your Whimsical content through the verified integration.

### 3. Claude Desktop

* Whimsical is available as a verified connector in Claude Desktop.
* Go to `Settings → Connectors` and connect Whimsical directly.
* If you need to add it manually, use the remote MCP server URL:
    ```json
    {
      "mcpServers": {
        "whimsical-remote": {
          "url": "https://mcp.whimsical.com/mcp"
        }
      }
    }
    ```
* Restart Claude Desktop after saving the configuration.

### 4. Other MCP Clients

If your AI client supports custom MCP servers, configure it with:

* Name: `whimsical-remote`
* URL: `https://mcp.whimsical.com/mcp`

Example:

```json
{
  "mcpServers": {
    "whimsical-remote": {
      "url": "https://mcp.whimsical.com/mcp"
    }
  }
}
```

### 5. Authentication

* Whimsical requires OAuth authentication through the client.
* Sign in with your Whimsical account when prompted.
* No manual token entry is required for the hosted MCP server.

### 6. Verify the Connection

* Ask your MCP client a simple prompt such as:
  - `What Whimsical tools do you have available?`
* If connected, the client should return available Whimsical actions such as `create_diagram`, `search_files`, or `create_board`.
* In Claude, check the MCP settings page or connector status for the Whimsical entry.

### 7. Notes

* Remote MCP is the recommended option for most users.
* Local desktop MCP is available only through the Whimsical desktop app and may require support from Whimsical.
* If the server does not connect, verify the URL and retry the OAuth login flow.
