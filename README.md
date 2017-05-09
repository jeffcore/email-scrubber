# Email Scrubber

## How To Use

Add all emails, one per line, to the email.txt file.  Then, run email.rb. The program scrubs using valid email format regex and the below  scrub files.
* scrub_baddomains - known bad domains
* scrub_obvious - obvious keywords that are not in valid emails
* scrub_proposedkeywords - your list of bad keywords
* scrub_recommended - known common character combinations and words

The program creates five files containing the bad emails from the above scrub lists and a bad format check (results_badformat.txt, results_baddomains.txt, results_obvious.txt, results_proposedkeywords.txt, results_recommended.txt). Use these files if you want to manually remove emails from your system.

There are also five more text files created named (email1.txt, email2.txt, email3.txt, email4.txt, email5.txt), these are created and overwritten during every execution.

File: email5.txt will be the cleaned up version of the list.

## Background

The scrub files were built from analyzing a list of 1 million known bad emails from an ecommerce website. I also did research on finding invalid emails based on words, domain and character combinations. This program was created in 2011 before my CS degree.

## Open Source Reason
I open sourced this program to help build the scrub file lists. The ruby code is basic implementation, but the scrub lists can be used in any language.
