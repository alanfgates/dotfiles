---
allowed-tools:  Bash(git diff:*), Bash(git log:*), Bash(gh pr view:*), Bash(gh pr diff:*), Bash(git symbolic-ref:*), Bash(sed:*)
description: Alan's code review tool
---

Review a PR or git branch using the following checklist.  If $ARGUMENTS is given and is a valid PR number for the
current git repository, then review that GitHub PR.  If $ARGUMENTS is empty and the current working directory is in
a git repository, and that repository is not on the default branch, review the current branch against the default
branch.  If none of these conditions hold issue an error and ask for clarification.

Use `gh pr view $ARGUMENTS` and `gh pr diff $ARGUMENTS` to fetch the PR details.

For branch review, use:
  - `git diff $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')...HEAD`
  - `git log $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')..HEAD`

**Context gathering:**
  - After viewing the diff, read the full contents of modified files to understand surrounding context.
  - For new files, read the entire file.
  - For modified files, read the full file to understand how changes fit into the existing code.
  - When checking if code follows codebase patterns, read similar files in the same directory or module for comparison.
  - Limit context gathering to files directly relevant to the changes; do not read the entire codebase.
  - For PRs with more than 10 changed files, prioritize reading the most complex or risky files in full, and note which files received limited review.

## Output Format
  - All output should be rated one of:  Critical, Major,  or Minor.  Issues are critical if they need fixed
    before more work is done, major if they need fixed before this PR or branch is merged back into the default
    branch, minor if it is something that would be good to do but not required.
  - Ignore nitpicking or stylistic issues.
  - When applicable, the file name(s) and line number(s) that are relevant for the output should be included.
  - Format the review as markdown with each section as a header.

## Summary
  - Summarize what this PR or branch does in 2-3 sentences.  For large PRs or branches with a larger number of changes,
    greater than 1000 lines of code, it is ok to generate a longer, 4-5 sentence summary.

## Clarity of Purpose
  - Is it clear what this PR or branch does?
  - If this PR or branch includes a PLAN.md or other specification or planning documents, do they include clear
    requirements?  Are the requirements complete or does the code make assumptions not covered in the requirements?
  - Does the PR or branch include a design, contained in PLAN.md or other specification or planning documents?  If
    so, is the design clear?  Does it conform to standard software designs?  Does the design meet any requirements
    that have been specified?  Does the code included in the PR or branch faithfully implement the design?

## Risk Analysis
  - Highlight any code that might produce race conditions.
  - Identify potential data loss scenarios.
  - Flag any changes to error handling that could mask failures.
  - Highlight any use of large data structures and give feedback on whether the data structure chosen is a good
    choice, and what other data structures would be a reasonable choice.
  - Highlight any important algorithm choices and give feedback on whether the choice is good, and what some other
    reasonable choices might be.

## Security
  - Flag any potential injection vulnerabilities (SQL, command, etc.)
  - Identify authentication/authorization concerns
  - Note any sensitive data handling issues

## Code Quality
  - Are there any obvious bugs or logic errors?
  - Does this follow the patterns established elsewhere in the codebase?
  - Is the code clear and well commented?  Will a later maintainer be able to easily understand the code's intent?

## Testing
  - If this PR or branch includes a PLAN.md or other specification or planning files, do these include validation
    criteria?  If so, does the PR or branch include tests to validate using those criteria?
  - Does this PR or branch include sufficient testing?  This can include unit, integration or other types of tests.

## Project Guidelines
  - If this project has a CLAUDE.md file, does this code adhere to the guidelines in it?

## Questions for Author
  - List any parts of the code that are unclear or need explanation



