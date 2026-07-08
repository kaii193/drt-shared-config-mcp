# drt-shared-config-mcp

This repository provides a lightweight scaffold for sharing MCP configuration files across services.

## Structure

- .mcp/ contains the main entrypoint and concrete provider configs
- docs/ contains setup and troubleshooting notes
- scripts/ contains bootstrap and validation helpers

## Quick start

1. Copy .env.example to .env and fill in secrets.
2. Review the files in .mcp/.
3. Run scripts/bootstrap.sh to initialize the environment.
4. Run scripts/validate.sh to verify configuration files.
