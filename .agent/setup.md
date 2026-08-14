# AI Workspace Setup Protocol

**SYSTEM DIRECTIVE FOR THE AI AGENT:**
You are about to conduct a setup interview with the human developer. Ask the following 9 questions **one by one** or as a group. Wait for their answers before proceeding to the post-interview generation instructions.

---

### Question 1: Project Objective & Vision
"What are we building? Provide a high-level overview of the application and its target audience."

### Question 2: Tech Stack & Architecture
"What is our technical stack? Include languages, frameworks, database/ORM choices, and any strict design patterns (e.g., MVC, Clean Architecture)."

### Question 3: Anti-Patterns & Banned Rules
"Are there any specific libraries, coding patterns, or practices that are explicitly BANNED in this repository?"

### Question 4: Testing & Quality Assurance
"What is our testing strategy, which framework should I use, and where should test files live?"

### Question 5: Codebase Boundaries & Directory Structure
"Where should primary source code live, and are there strict directory routing or file naming conventions?"

### Question 6: AI Toolchain & Audit Workflow
"Which specific AI models will you use for primary coding vs. auditing, and do you want to enable the Red-Team Audit workflow?"

### Question 7: Autonomy & Execution Throttling
"How autonomous should I be? Do you want me to pause frequently (e.g., 50-line rule) or run continuously in Overnight Mode?"

### Question 8: VSCode & Editor Integration
"Do you want me to generate editor-specific configuration files (like `.cursorrules`, `.github/copilot-instructions.md`, or VSCode `tasks.json`)?"

### Question 9: Living Documentation (ReadTheDocs)
"Do you want me to continuously generate and maintain human-readable ReadTheDocs-style Markdown documentation in `/docs`?"

---

## POST-INTERVIEW INSTRUCTIONS (For the AI Agent)

Once the human answers all questions, execute this compilation sequence:

1. **Synthesize:** Process all answers.
2. **Generate Active Core:** Populate `.agent/active/tech-stack.md` and `.agent/active/testing-protocol.md` using `.agent/templates/`.
3. **Generate Living Docs Protocol:** If requested in Q9, populate `.agent/active/docs-protocol.md` and initialize the `/docs/` directory.
4. **Generate Editor Configs:** If requested in Q8, create `.cursorrules`, `.github/copilot-instructions.md`, or `.vscode/settings.json`.
5. **Generate `.agent/active/agent.md`:** Populate core directives, injecting autonomy throttle, model versions, and shutdown sync rules.
6. **Initialize Memory:** Create initial JSON structures inside `.agent/active/memory-longterm.md` and `.agent/active/memory-shortterm.md`.
7. **Confirm:** Output: "Configuration complete. All active files generated in `.agent/active/`. I am ready to begin coding."

