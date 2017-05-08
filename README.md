# Email Scrubber

## How To Use

Add all emails, one per line, to the email.txt file.  Then, run email.rb. The program scrubs using valid email format regex and the below  scrub files.
* scrub_baddomains - known bad domains
* scrub_obvious - obvious keywords that are not in valid emails
* scrub_proposedkeywords - your list of bad keywords
* scrub_recommended - known common character combinations and words

The program exports a list of files, including bad emails, for each of the above files.  There are also four more text files created named (email1, email2, email3, email4), these are created and overwritten during every execution.

## Background

The scrub files were built from analyzing a list of 1 million known bad emails from an ecommerce website. I also did research on finding invalid emails based on words, domain and character combinations.
