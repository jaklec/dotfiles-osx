---
name: process-inbox
description: Process inbox items one by one using the GTD clarify workflow.
---

# Process Inbox

Your goal is to guide the user through processing their Taskwarrior inbox one item at a time. The inbox is defined by tasks with the `+inbox` tag and `status:pending`.

## Processing Flow

1. **Get Inbox Tasks**: Get the list of all inbox tasks using `bash: task status:pending +inbox export`. This returns a JSON array of tasks.
2. **Check if Empty**: If the array is empty, congratulate the user on achieving "inbox zero" and stop.
3. **Process One by One**: Take the first task from the list and display its description to the user.
4. **Guide Clarification**: For that single task, walk the user through the "GTD Clarify Questions" below.
5. **Execute Modifications**: Based on the user's answers, construct and execute the necessary `task modify` commands. You may need to run multiple commands for a single task (e.g., one for project, one for tags).
6. **Remove from Inbox**: Once a task is fully processed, remove the `+inbox` tag using `bash: task <uuid> modify -inbox`. This is the final step for each task.
7. **Loop**: Go back to step 1 to fetch the remaining inbox items and repeat the process with the next task.

## The GTD Clarify Questions

For each inbox item, ask these questions to determine the right modifications:

1. **What is it?** Is the description clear and accurate? If not, help the user rephrase it.
   - Command: `task <uuid> modify description:"New description"`
2. **Is it actionable?**
   - NO: Is it trash? Use `task <uuid> delete`.
   - NO: Is it something for later? Use `task <uuid> modify +someday` and remove `+inbox`.
   - NO: Is it reference material? Decide where to put it (e.g. Obsidian, notes) and then `task <uuid> delete`.
   - YES: Continue to the next question.
3. **What's the next action?**
   - Can it be done in under 2 minutes? Advise the user to do it immediately. Once they confirm it's done, mark it as complete with `task <uuid> done`.
   - Is it part of a larger outcome? Help the user define a project for it with `task <uuid> modify project:"The Project Name"`.
   - Otherwise, ensure the task description is a single, clear next action.
4. **Add Context**: What tool, place, or person is needed? These become tags.
   - Examples: `+@computer`, `+@errands`, `+email`.
   - Command: `task <uuid> modify +tag1 +tag2`.
5. **Set Dates** (use sparingly):
   - Does it have a hard deadline? Use `task <uuid> modify due:YYYY-MM-DD`.
   - Do you want to hide it until a future date? Use `task <uuid> modify wait:YYYY-MM-DD`.

## Important Reminders

- Process one task at a time.
- The final action for every processed task is always `task <uuid> modify -inbox`.
- Use the task's `uuid` for all modification commands.
