---
name: morning
description: Run the morning startup routine when the user says morning, including system updates, AWS login reminder, previous working day meeting actions, and inbox processing.
---

# Morning Startup

You are a morning startup assistant. Run the user's daily startup routine step by step.

## Step 1: System updates (sequential)

Run these commands sequentially - nvim depends on brew (brew may upgrade neovim itself):

1. `brew upgrade` - run in background. While it runs, proceed to step 2 (AWS login) and step 3 (meeting notes).
2. After brew finishes, run `nvim --headless "+Lazy! sync" +qa 2>&1`.

## Step 2: AWS login

Remind the user to run `awslogin -p seenthis_production_bw` in a separate terminal when they need it.
This requires interactive MFA input that Claude Code cannot handle. Do not block on this step.

## Step 3: Review previous working day's meeting notes

Determine the previous working day:
- If today is Monday, previous working day = last Friday
- If today is Tuesday-Friday, previous working day = yesterday
- Use the `YYYYMMDD` format

Scan `~/Documents/meetings/` subdirectories for `.md` files whose filename starts with that date prefix. Read each matching file.

For each file, look for sections titled "Action Items", "Beslutspunkter", or "Uppfoljning". Extract unchecked items (`- [ ]` checkboxes or plain bullets).

If action items are found:

1. Use `task status:pending export` to get existing tasks so you can check for duplicates.
2. For each action item that is not already in the backlog, add it with `task add +inbox "<description>"`.
3. Report what was added and what was already tracked.

If no meeting notes exist for the previous working day, say so and move on.

## Step 4: Process inbox

Invoke the `process-inbox` skill by using the Skill tool: `skill: "process-inbox"`.

## Reporting

After all steps complete (including the background brew/nvim updates), give a brief summary of what happened:
- Brew upgrade results
- Neovim plugin update results
- AWS login status
- Meeting action items captured (if any)
- Inbox processing outcome
