# Copilot Instructions: Autonomous AI Agent Context & Memory Framework

## Project Overview
- **Name:** Autonomous AI Agent Context Workspace
- **Stack:** Language-Agnostic (relies on Markdown, minified JSON caches, and Bash for initialization).
- **Goal:** To enforce token-optimized context retention, mandate rigorous automated testing, and maintain living documentation without bloating API context windows.

---

## Architecture & Memory File Structure
- **Workspace Boundaries:** Never modify files inside `.agent/templates/`. All AI state and configuration read/write operations must happen strictly within `.agent/active/`.
- **The Amnesia Rule (Dual-Memory):** Start every session by reading `.agent/active/memory-longterm.md` (for macro-architecture) and `.agent/active/memory-shortterm.md` (for current WIP). Do not rely on conversational chat history to understand the project state.
- **Session Shutdown:** At the end of every major task, compress the completed state into minified JSON within `memory-shortterm.md`. Move finalized architectural decisions to `memory-longterm.md`.
- **Living Documentation:** Automatically reflect structural or API changes inside the human-readable `/docs/` directory (`architecture.md`, `api.md`, `setup.md`).

---

## Coding Standards & Verification

### The "Triad" Testing Protocol
- **No Manual Verification:** Relying solely on `console.log()` or raw print statements for verification is strictly banned.
- **Mandatory Dummy Data:** When generating tests, you must implement the Triad Profile:
  1. **Happy Path:** Expected input data and formats.
  2. **Edge Cases:** Empty sets, nulls, boundary limits, and malformed strings.
  3. **Failure Path:** Invalid types/auth intentionally designed to hit error handlers.

### Code Generation & Tech Stack Adherence
- **Strict Compliance:** Before generating source code, you must read `.agent/active/tech-stack.md` to ensure you do not use banned patterns, deprecated libraries, or violate the user's chosen architecture.
- **Model Identity Logging:** When updating memory files, log the model identity (e.g., GPT-4o, Claude 3.5) responsible for the current session to maintain an audit trail.

---

## Do's and Don'ts for AI Agents

### DO:
- Always confirm the current objective by checking `memory-shortterm.md` before writing code.
- Write strict, automated unit/integration tests alongside any new component generation.
- Keep JSON states inside the markdown memory files as minified as possible to conserve input tokens.
- Consult `.agent/active/reviewer.md` if performing a Red-Team code audit.

### DON'T:
- Do NOT generate code without first verifying the user's constraints in `.agent/active/tech-stack.md`.
- Do NOT overwrite `.agent/templates/`—these are immutable factory defaults.
- Do NOT output massive, uncompressed chat responses; be concise and update the memory files instead.
- Do NOT assume project history—always read the memory files if context feels lost.
