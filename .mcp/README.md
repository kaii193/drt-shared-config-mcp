# MCP config folder

This folder stores the concrete MCP server configurations used by the project.

- Use mcp.json as the main entrypoint.
- Keep provider-specific configs in .json files such as github.json, prisma.json, and whimsical.json.
- Store secrets in environment variables rather than hardcoding them.
