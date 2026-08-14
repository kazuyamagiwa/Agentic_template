# 🤖 Autonomous AI Agent Context & Memory Framework

> **A token-optimized, multi-model template repository for AI-assisted software development.**  
> Stop burning API credits, losing track of codebases mid-session, or spending hours writing manual test data.

---

## 🌟 Key Features

* **🧠 Dual-Memory Architecture (Minified JSON Caching):**
  * **Short-Term Session Cache (`memory-shortterm.md`):** Tracks immediate tasks and uncommitted changes during the workday. Flushed daily to prevent input token bloat.
  * **Long-Term Epoch Cache (`memory-longterm.md`):** Immutable, compressed history of macro-architecture and completed milestones.
* **⏱️ Dynamic Autonomy Throttling:**
  * Toggle seamlessly between **Pair-Programming Mode** (strict pauses after 50 lines / major components) and **Overnight Autonomous Mode** (uninterrupted multi-file execution).
* **🔍 Multi-Model Identity & Red-Team Auditing:**
  * Track which specific LLM model executed which session in the memory logs.
  * Optional Red-Team Audit workflow using a secondary model (e.g., OpenAI o1 reviewing Claude 3.5 Sonnet) before commits.
* **🧪 Mandatory "Triad" Verification:**
  * Forces the AI to generate automated unit/integration tests with **Happy Path**, **Edge Case**, and **Failure Path** dummy data alongside source code. Banning raw `console.log()` verification.
* **📚 Living ReadTheDocs Sync (`/docs`):**
  * Keeps human-readable documentation (`/docs/architecture.md`, `/docs/api.md`, `/docs/setup.md`) continuously updated without cluttering the AI's core operating context.
* **🔌 Native IDE Bindings:**
  * Native configuration support for **Cursor** (`.cursor/rules/`), **GitHub Copilot** (`.github/copilot-instructions.md`), and **VSCode** (`.vscode/tasks.json`).

---

## 📂 Repository Structure

```text
my-ai-project/
├── .agent/
│   ├── templates/                      # Raw, unpopulated templates (Immutable)
│   │   ├── agent.template.md           # Master operating system & execution rules
│   │   ├── tech-stack.template.md      # Technical constraints & banned patterns
│   │   ├── testing-protocol.template.md# Framework rules & Triad dummy data policy
│   │   ├── reviewer.template.md        # Red-Team security & quality audit checklist
│   │   ├── docs-protocol.template.md   # ReadTheDocs living documentation rules
│   │   ├── memory-longterm.template.md # Global Epoch Cache (Minified JSON history)
│   │   └── memory-shortterm.template.md# Ephemeral Session Cache (Minified JSON state)
│   │
│   ├── active/                         # Active runtime context files (Populated via setup.md)
│   │   ├── agent.md                    # Active master prompt read at session start
│   │   ├── tech-stack.md               # Active project stack directives
│   │   ├── testing-protocol.md         # Active testing rules & framework choice
│   │   ├── reviewer.md                 # Active audit template
│   │   ├── docs-protocol.md            # Active living docs configuration
│   │   ├── memory-longterm.md          # Permanent project milestones
│   │   └── memory-shortterm.md         # Ephemeral workday working memory
│   │
│   └── setup.md                        # The 9-question interactive interview script
│
├── .github/                            # (Optional) Copilot instructions
│   └── copilot-instructions.md
├── .vscode/                            # (Optional) VSCode / Cursor settings & tasks
│   ├── settings.json
│   └── tasks.json
├── docs/                               # Living human-readable documentation
│   ├── architecture.md
│   ├── api.md
│   └── setup.md
├── init.sh                             # Non-destructive initial bootstrapper
└── README.md                           # Project documentation (You are here)
```

---

## 🚀 Quickstart Guide

### 1. Initialize the Workspace
Clone or use this repository as a GitHub Template. Run the initialization script in your terminal to safely prepare the `.agent/active/` directory:

```bash
chmod +x init.sh
./init.sh
```

### 2. Run the Interactive AI Setup
Open your AI coding assistant (Cursor, Claude Dev, ChatGPT, Aider, GitHub Copilot, etc.) and paste the following prompt:

> *"Please read `.agent/setup.md` and conduct the 9-question setup interview with me."*

Answer the questions regarding:
1. **Project Vision** & Scope
2. **Tech Stack** & Framework choices
3. **Banned Patterns** (Anti-patterns to avoid)
4. **Testing Framework** & placement
5. **Directory Boundaries**
6. **Model Toolchain** & Red-Team Audit preferences
7. **Autonomy Throttle** (50-line pairing vs. Overnight mode)
8. **IDE Integrations** (Cursor / Copilot / VSCode)
9. **Living Documentation** (ReadTheDocs in `/docs`)

The AI will automatically generate your customized context files inside `.agent/active/`.

---

## 🔄 Daily Workflow & Session Lifecycle

```text
┌─────────────────────────────────────────────────────────┐
│                     1. SESSION START                    │
│  AI reads memory-longterm.md + memory-shortterm.md +    │
│  agent.md → Confirms current objective with human.      │
└──────────────────────────┬──────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    2. EXECUTION PHASE                   │
│  AI generates code complying with tech-stack.md.        │
│  Simultaneously generates tests (Triad Dummy Data).     │
│  Respects autonomy throttle (Pairing vs Overnight).     │
└──────────────────────────┬──────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                 3. AUDIT PHASE (OPTIONAL)               │
│  Secondary model loads reviewer.md → Audits logic &     │
│  security vulnerabilities → Outputs <AUDIT_REPORT>.     │
└──────────────────────────┬──────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    4. SESSION SHUTDOWN                  │
│  AI flushes short-term state to memory-shortterm.md.    │
│  Compresses milestones into memory-longterm.md.         │
│  Updates human-readable docs in /docs/ (if enabled).    │
└──────────────────────────┴──────────────────────────────┘
```

---

## 🛠️ Core Concepts

### The "Amnesia Rule" & Dual Token Caches
Large language models suffer from context loss and rising credit costs as conversations grow.
* To solve this, every new coding session starts fresh with the **Amnesia Rule**. 
* The AI reloads its context strictly from `.agent/active/memory-longterm.md` (high-level JSON architecture state) and `.agent/active/memory-shortterm.md` (active JSON task state).
* No long conversational histories are re-read, reducing input token overhead by up to **80%**.

### The Triad Testing Protocol
Manual line-by-line debugging and terminal `console.log()` statements waste time. The AI is required to prove its code works by outputting tests containing three distinct dummy data profiles:
1. **Happy Path:** Expected input formats.
2. **Edge Cases:** Empty sets, nulls, boundaries, extremely long strings.
3. **Failure Path:** Invalid types and unauthorized access designed to hit error handlers.

### Model Identity & Accountability
When switching between models mid-project (e.g., using Claude 3.5 Sonnet for architecture, Llama-3 locally via Ollama to save credits, or GPT-4o for code review), the AI logs its exact model version in `.agent/active/memory-shortterm.md`. If bugs or structural drifts occur, you can audit which model introduced them.

---

## 📄 License

This framework template is open-source under the [MIT License](LICENSE). Feel free to adapt and customize the directives in `.agent/templates/` for your specific team workflow.
```
