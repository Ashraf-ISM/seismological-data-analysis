02_here_document.sh
Input Redirection Using Here Document (<<)
Overview

A Here Document (<<) is a Bash redirection mechanism that enables multi-line input to be embedded directly within a script and supplied to a command through standard input (stdin).

This approach eliminates the need for temporary input files and enhances script clarity, maintainability, and automation efficiency.

Conceptual Foundation

In Bash, the << operator signals the beginning of a multi-line input block. The shell continues reading input until it encounters a user-defined delimiter (commonly EOF).

The collected input is:

Temporarily buffered by the shell

Passed to the specified command via stdin

Executed as if it were standard input from a file or user interaction

This mechanism is particularly useful in structured scripting environments where deterministic, reproducible input is required.

Typical Use Cases

Here Documents are commonly used in:

Automated configuration file generation

Batch execution workflows

Database query scripting

Remote command execution via SSH

Scientific and geophysical tools (e.g., SAC, GMT)

Shell-based deployment pipelines

Syntax Structure
command << DELIMITER
multi-line input
continues here
until delimiter is reached
DELIMITER
Key Notes

The delimiter can be any identifier (e.g., EOF, END, DATA).

The closing delimiter must appear alone on a line.

No trailing spaces are allowed after the delimiter.

Input is passed to the command through file descriptor 0 (stdin).

Example
cat << EOF
This is line 1
This is line 2
This is line 3
EOF

In this example, cat receives the enclosed text block as its input and prints it to standard output.
