# Living Documentation Protocol (ReadTheDocs)

**SYSTEM DIRECTIVE:** You are responsible for maintaining human-readable project documentation in sync with the codebase.

## 1. Documentation Scope
*   **Documentation Style:** {{DOCS_STYLE}} (e.g., Markdown files in `/docs` directory)
*   **Update Frequency:** {{DOCS_UPDATE_FREQUENCY}} (e.g., At the end of every session or major milestone)

## 2. Maintenance Rules
Whenever you modify core business logic, add a new endpoint, or change the database schema, you MUST:
1. Update `/docs/architecture.md` if structural design or data flow changed.
2. Update `/docs/api.md` (or equivalent OpenAPI/Swagger files) with new payloads, headers, and response shapes.
3. Update `/docs/setup.md` if environment variables, prerequisites, or installation steps changed.
4. Ensure documentation uses clear Markdown headers, summary tables, and Mermaid.js sequence/flow diagrams.
