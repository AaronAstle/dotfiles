---
name: daily-briefing
description: >
  Daily work briefing and standup summary. Use this skill when the user asks for a
  daily standup, morning briefing, work summary, priorities, "what should I work on",
  "what's on my plate", or anything related to reviewing their current workload.
  Also trigger on session start greetings like "good morning" or "start my day".
---
# Daily Work Briefing
Generate a comprehensive daily work briefing by gathering data from all available sources.
## Tool Availability Check
Run once per session before gathering data. Silently verify each source is callable:
| Source | Tool | Verification |
|--------|------|--------------|
| ADO MCP | `wit_my_work_items` or `repo_list_pull_requests_by_repo_or_project` | Attempt a lightweight call |
| WorkIQ | `workiq-ask_work_iq` (requires invoking the `workiq` skill first) | Check if tool is available |
3
Display status after header:
```
☀️ **Daily Briefing**
Checking sources...
🟢 ADO  🟢 WorkIQ
Gathering data...
```
- 🟢 = Available | 🔴 = Unavailable
- Never block — proceed with whatever sources are available
## Graceful Degradation
When a source is unavailable, use alternatives transparently:
| Unavailable Source | Alternative |
|--------------------|-------------|
| **ADO MCP tools** | Use `az boards` / `az repos pr` CLI commands via PowerShell |
| **WorkIQ** | Skip the Recent Highlights section. Note: "WorkIQ unavailable — check email/Teams manually for recent activity." |
| **Both missing** | Use `az` CLI for ADO data, skip WorkIQ section |
Always deliver the best briefing possible with available sources. Briefly note which sources were unavailable.
## Steps
Perform ALL of the following steps **in parallel where possible**, except where dependencies exist (e.g., Step 3 requires invoking the `workiq` skill before calling the tool):

### 1. ADO Work Items
Fetch my active work items from the **Engineering** project.
- **Primary:** `wit_my_work_items` MCP tool with `project: "Engineering"`
- **Fallback:** `az boards query` via PowerShell
### 2. My Pull Requests
Fetch all of my active pull requests.
- **Primary:** `repo_list_pull_requests_by_repo_or_project` MCP tool with `project: "Engineering"`, `created_by_me: true`
- **Fallback:** `az repos pr list --creator "me" --status active` via PowerShell
For each PR found, also fetch:
- **Comment threads** using `repo_list_pull_request_threads` (fallback: `az repos pr thread list --id <PR_ID>`) — note any unresolved threads or new comments
- **Review status / votes** from the PR details — approvals, rejections, waiting for author
- **Build status** using `pipelines_get_build_status` if the PR has an associated build (fallback: `az repos pr policy list --id <PR_ID>` to check build policy status)

### 3. Recent Activity from Email & Teams
First invoke the `workiq` skill (using the `skill` tool) to ensure WorkIQ tools are available, then use the `workiq-ask_work_iq` tool to ask:
> "What are the most important things I've been working on in the past week? Include key emails, Teams messages, meetings, and any action items or decisions that were made."
If WorkIQ is unavailable, skip this step and note the gap in the output.

### 4. PRs Where I Am a Reviewer
Fetch PRs where I am a reviewer.
- **Primary:** `repo_list_pull_requests_by_repo_or_project` MCP tool with `project: "Engineering"`, `i_am_reviewer: true`
- **Fallback:** `az repos pr list --reviewer "me" --status active` via PowerShell
Flag any that are waiting on my review (vote = 0).
## Output Format
Combine everything into a single, scannable daily briefing with these sections:
**🎯 Suggested Priorities** — Based on ALL the data (ADO items, PRs, emails, Teams, meetings), suggest my top 5 priorities for today. Consider:
  - Items that are blocked or overdue
  - PRs with failing builds or unresolved comments that need my attention
  - PRs that are approved and ready to merge
  - PRs waiting on my review
  - Action items from recent emails/meetings
  - Work items in progress that need attention
  - Upcoming deadlines or commitments
**📋 ADO Summary** — Active item count, grouped by type (Bug, Task, User Story, etc.), top items with ID, title, state
**🔀 PR Dashboard** — For each of my PRs show: title, repo, status (draft/active), build status (pass/fail/running), reviewer votes, count of unresolved comment threads. Flag PRs that need action. Also list PRs waiting on my review separately.
**💬 Recent Highlights** — Key threads, decisions, and action items from emails and Teams in the past week. If WorkIQ was unavailable, display: "⚠️ WorkIQ unavailable — check Outlook and Teams for recent activity."
Keep it concise and actionable — this is my morning standup glance.