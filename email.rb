## Email Scrubber 2011

##BAD FORMAT SCRUB
def bad_format_rewrite_email_list ()
  puts "Bad Format Scrub Starts"
  b = File.new("results_badformat.txt", "w+")
  e2 = File.new("email1.txt", "w+")
  File.open("email.txt").each do |f|
    f.each_line do |line|
      if !(line.match(/^[^@].+@\S\S+\.\S+[^@]$/))
        b.puts line
      else
        e2.puts line
      end
    end
  end
  puts "Bad Format Scrub Ends"
  puts Time.now.to_s
  puts " "

  e2.close
  b.close  
end

# constant to name file
$email_text_file_number = 1

## scrub emails against list in scrubFile parameter
## rewrites source email list to new file excluding bad emails
## why do I do this, you might ask?
##   1. offers speed improvements for bad lists
##   2. so bad email output files have unique emails

def scrubber_rewrite_email_list (name, resultsFile, scrubFile)
  total_rows = 0

  puts name + " Starts"
  puts Time.now

  b = File.new(resultsFile, "w+")
  e2 = File.new("email" + ($email_text_file_number + 1).to_s() +".txt", "w+")
  File.open("email" + $email_text_file_number.to_s() +".txt").each do |f|
    f.each_line do |line|
      i = 0
      File.open(scrubFile).each do |s|
        s.each_line do |word|
          if line.upcase.match(word.strip.upcase)
            if i == 0
              b.puts line
              i += 1
            end
          end
          total_rows += 1
        end
      end
      if i == 0
        e2.puts line
	  end
    end
  end

  e2.close
  b.close

  puts name + " ends"
  puts Time.now.to_s
  puts total_rows.to_s + " executed"
  puts " "

  $email_text_file_number += 1

end

##BAD FORMAT SCRUB
bad_format_rewrite_email_list()
##FULL EMAIL OBVIOUS SCRUB
scrubber_rewrite_email_list("Email Obvious Scrub", "results_obvious.txt", "scrub_obvious.txt")
##FULL RECOMMENDED SCRUB
scrubber_rewrite_email_list("Email Recommended Scrub", "results_recommended.txt", "scrub_recommended.txt")
##BAD DOMAIN SCRUB
scrubber_rewrite_email_list("Bad Domain Scrub", "results_baddomains.txt", "scrub_baddomains.txt")
##PROPOSED KEYWORD SCRUB
scrubber_rewrite_email_list("Proposed KeywordsScrub", "results_proposedkeywords.txt", "scrub_proposedkeywords.txt")
puts "Press enter to finish"
gets
