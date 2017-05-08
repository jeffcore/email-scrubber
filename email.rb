## Email Scrubber
##BAD FORMAT SCRUB
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

e2.close
b.close

$emailTextFileNumber = 1

##rewrites source email file removing bad emails
def scrubber_rewrite_email_list (name, resultsFile, scrubFile)
  puts "email number" + ($emailTextFileNumber + 1).to_s()
   puts "fuck you"
  total_rows = 0

  puts name + " Starts"
  puts Time.now

  b = File.new(resultsFile, "w+")
  e2 = File.new("email" + ($emailTextFileNumber + 1).to_s() +".txt", "w+")
  File.open("email" + $emailTextFileNumber.to_s() +".txt").each do |f|
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

  $emailTextFileNumber += 1
 # puts $emailTextFileNumber
end

#SCRUB METHOD
def scrubber (name, resultsFile, scrubFile)

  puts name + " Starts"
  puts Time.now
  total_rows = 0
  b = File.new(resultsFile, "w+")
  File.open("email2.txt").each do |f|
    f.each_line do |line|
      i = 0
      File.open(scrubFile).each do |s|
        s.each_line do |word|
          if line.upcase.match(word.strip.upcase)
            if i == 0
              b.puts line
              i= i + 1
            end
          end
          total_rows = total_rows + 1
        end
      end
    end
  end

  puts name + " Ends"
  puts Time.now.to_s
  puts total_rows.to_s + " executed"
  puts " "

end

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
